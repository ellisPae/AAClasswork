class User < ApplicationRecord
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    attr_reader :password

    after_initialize :ensure_session_token

    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return user if user && user.is_password?(password)
        nil
    end


    def reset_session_token!
        self.session_token = User.generate_session_token
        # self.session_token = setter method => can be saved
        # NOT @session_token
        self.save!
        self.session_token
    end


    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
        # self.password_digest = setter method => can be saved
        # NOT @password_digest
    end

    
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end




    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end


end
