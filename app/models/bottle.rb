class Bottle < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :area
    belongs_to :column, optional: true
    has_many :comments, dependent: :destroy
    has_many :tagmaps, dependent: :destroy, foreign_key: 'bottle_id'
    has_many :tags, through: :tagmaps
    has_many :relationships, dependent: :destroy
    has_many :recommendations, through: :relationships, source: :recommendation
    has_one :taste
    attachment :image
    # enum classification:["シングルモルト":0, "シングルグレーン":1]
    enum status:{imexpensive: 0,normal_price:1,expensive:2}
    def tags_save(tag_list)
        if self.tags!=nil
            bottle_tags_records = Tagmap.where(bottle_id: self.id)
            bottle_tags_records.destroy_all
        end

        tag_list.each do |tag|
            inspected_tag=Tag.find_or_create_by(tag_name: tag)
            self.tags<<inspected_tag
        end
    end

    def self.search(word)
        Bottle.where("japanese_bottle_name LIKE?","%#{word}%")
    end

    def recommend(other_bottle)
        unless self == other_user
          self.relationships.find_or_create_by(recommendation_id: other_bottle.id)
        end
    end

    def unrecommend(other_bottle)
        relationship = self.relationships.find_by(recommendation_id: other_bottle.id)
        relationship.destroy if relationship
    end

    def recommending?(other_bottle)
        self.recommendations.include?(other_bottle)
    end
end
