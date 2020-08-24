# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord

    validates :title, :description, :moderator_id, presence: true

    belongs_to :moderator,
        class_name: :User

    has_many :postsubs, dependent: :destroy, inverse_of: :sub

    has_many :posts, through: :postsubs

end
