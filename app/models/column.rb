class Column < ApplicationRecord
	has_one :bottle
	attachment :image
end
