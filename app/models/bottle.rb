class Bottle < ApplicationRecord
    belongs_to :area
    has_many :comments, dependent: :destroy
    has_many :tag_maps, dependent: :destroy
    attachment :image
    # enum classification:[:シングルモルト, :シングルグレーン]
end
