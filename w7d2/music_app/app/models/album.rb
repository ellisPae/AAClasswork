class Album < ApplicationRecord
    validates :title, :year, presence: true
    validates :live, inclusion: {in: [true, false]}
    validates :title, uniqueness: {scope: :band_id}



    belongs_to :band,
        class_name: :Band,
        primary_key: :id,
        foreign_key: :band_id



end
