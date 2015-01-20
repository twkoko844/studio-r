1.upto(11) do |ixd|
  Bookedmaterial.create(
  {
    :booking => Booking.find(ixd),
    :material => Material.find(ixd*3)
  }
  )
end

1.upto(11) do |ixd|
  Bookedmaterial.create(
  {
    :booking => Booking.find(ixd),
    :material => Material.find(ixd*4)
  }
  )
end
