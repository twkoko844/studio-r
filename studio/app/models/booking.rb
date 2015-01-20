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
    end
  end
  class << self
    def search(room, date)
      booking = Booking.where(room_id: room, date: date)
    end
  end
end
