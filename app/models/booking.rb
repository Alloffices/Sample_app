class Booking < ActiveRecord::Base
  acts_as_votable
  include Bookable

  belongs_to :user
end
