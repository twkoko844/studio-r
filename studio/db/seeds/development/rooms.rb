p "create RoomImage..."
1.upto(4) do |idx|
  @room = "room"+idx.to_s
  room = Room.create(
    name: @room
  )
  fname = Rails.root.join("db/seeds/development/img", "studioimg#{idx}.jpg")
  RoomImage.create(
  { room: room,
    data: File.open(fname, "rb").read,
    content_type: "image/jpeg"
  }, without_protection: true)
end
