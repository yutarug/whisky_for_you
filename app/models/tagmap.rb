class Tagmap < ApplicationRecord
    belongs_to :bottle
    belongs_to :tag
end
