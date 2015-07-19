class Lead < ActiveRecord::Base

	validates :name, :email, :devise, :social_media, presence: true
end
