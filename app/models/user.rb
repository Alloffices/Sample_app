class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings

  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  after_create :send_notification

  def send_notification
    AdminMailer.new_user(self).deliver
  end

  def add_booking(booking)
    start_time = booking.start_time
    if bookings.where(start_time: start_time.beginning_of_day..start_time.end_of_day).size < 2
      bookings << booking
      true
    else
      false
    end
  end
end
