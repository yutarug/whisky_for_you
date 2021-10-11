class Tag < ApplicationRecord
    has_many :bottles, through: :tagmaps
    has_many :tagmaps, dependent: :destroy, foreign_key: 'tag_id'
    # validates :name, uniquness: true
end
