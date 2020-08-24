# == Schema Information
#
# Table name: postsubs
#
#  id         :bigint           not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Postsub < ApplicationRecord
    validates :sub_id, uniqueness: { scope: :post_id }

    belongs_to :post

    belongs_to :sub
end
