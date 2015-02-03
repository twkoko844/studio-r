class Booking < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :member
  belongs_to :room
  has_many :bookedmaterials, dependent: :destroy
  has_many :materials, through: :bookedmaterials, source: :material
  validate :date_check
  def date_check
    if date < Date.today
      errors.add(:date, "can't be in the past")
    elsif (date == Date.today) && from < Time.now.strftime("%H").to_i - 12
      errors.add(:date, "can't be in the past time")
    end
  end
  class << self
    def search(room, date)
      booking = Booking.where(room_id: room, date: date)
    end
  end
end
