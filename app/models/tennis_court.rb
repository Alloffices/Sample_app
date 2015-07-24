class TennisCourt < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :bookings do

    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end

    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end

  end


end
