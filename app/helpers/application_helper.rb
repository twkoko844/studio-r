module ApplicationHelper
  def room_image_tag(room, options = {})
    if room.image.present?
      path = room_path(room, format: room.image.extension)
      link_to(image_tag(path, { alt: room.name, id: "r" }.merge(options)), path)
    else
      ""
    end
  end
end
