class Bottle < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :area
    has_many :comments, dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    attachment :image
    # enum classification:[:シングルモルト, :シングルグレーン]
end
