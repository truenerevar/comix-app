class Universe < ApplicationRecord
		has_many :heroes
		 mount_uploader :avatar, AvatarUploader
end
