class Relationship < ApplicationRecord
	belongs_to :bottle
	belongs_to :recommendation, class_name: 'Bottle'

	validates :bottle_id, presence: true
	validates :recommendation_id, presence: true
end
