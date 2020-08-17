# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true}
    validates :session_token, presence: true, uniqueness: true
    
    after_initialize :ensure_session_token 


    attr_reader :password

    def self.find_by_user_credentials(username, password)
        user = User.find_by(user_name: username)
        crypted_pw = BCrypt::Password.new(user.password_digest) 
        return user if user && crypted_pw.is_password?(password)
        nil     
    end

    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16) #default value is 16
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save! #when would this fail?
        self.session_token
    end


    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end


    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end




end
