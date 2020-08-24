# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord

    validates :title, :author_id, presence: true

    belongs_to :author,
        class_name: :User

    has_many :postsubs, dependent: :destroy, inverse_of: :post

    has_many :subs, through: :postsubs

    has_many :comments


end
