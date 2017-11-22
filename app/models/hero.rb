class Hero < ApplicationRecord
	belongs_to :universe
	has_many :gifts
end
