class Gift < ApplicationRecord
	belongs_to :hero
	has_many :skills
end
