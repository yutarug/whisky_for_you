class Bottle < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :area
    
    has_many :comments, dependent: :destroy
    has_many :tags, through: :tag_maps
    has_many :tag_maps, dependent: :destroy,foreign_key: 'bottle_id'
    attachment :image
    enum classification:["シングルモルト":0, "シングルグレーン":1]
end
