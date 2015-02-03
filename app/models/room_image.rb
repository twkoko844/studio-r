class RoomImage < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :room
  
  IMAGE_TYPES = { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }
  def extension
    IMAGE_TYPES[content_type]
  end
end
