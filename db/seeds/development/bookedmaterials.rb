1.upto(40) do |ixd|
  Bookedmaterial.create(
  {
    :booking => Booking.find(ixd),
    :material => Material.find(ixd%51+1)
  }
  )
  Bookedmaterial.create(
  {
    :booking => Booking.find(ixd),
    :material => Material.find(ixd%51+2)
  }
  )
end
