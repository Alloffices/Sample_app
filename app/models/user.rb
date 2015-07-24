class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :booking  do

    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end

    def this_week
      where(:created_at => (Time.zone.now.beginning_of_week..Time.zone.now))
    end

  end

  has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  after_create :send_notification

  def send_notification
 	AdminMailer.new_user(self).deliver
  end


end
