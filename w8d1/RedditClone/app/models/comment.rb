# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :string           not null
#  author_id  :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

    validates :content, :post_id, :author_id, presence: true

    
    belongs_to :post

    belongs_to :author,
        class_name: :User
    
    belongs_to :parent_comment,
        foreign_key: :parent_comment_id,
        class_name: :Comment,
        optional: true

    has_many :child_comments,
        foreign_key: :parent_comment_id
end
