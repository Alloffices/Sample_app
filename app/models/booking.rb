require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  	acts_as_votable  	
  	include Bookable

  	
  	belongs_to :user

 	# validate :user_quota, :on => :create


  # 	def user_quota

		# if user.bookings.today.count >= 2
		# errors.add(:base, "Exceeds daily limit")
	
		# elsif user.bookings.this_week.count >= 5
		# errors.add(:base, "Exceeds weekly limit")

		# end
  # 	end


end