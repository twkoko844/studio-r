class Room < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :booking
  has_one :image, class_name: "RoomImage", dependent: :destroy
end
