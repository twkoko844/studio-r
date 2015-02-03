# coding: utf-8
1.upto(20) do |ixd|
  Booking.create(
    :book_id => SecureRandom.hex(4),
    :member => Member.find(ixd%5+2),
    :date => Date.today + ixd,
    :from => 4,
    :to => 7,
    :room => Room.find(ixd%4+1)
  )
end
1.upto(20) do |ixd|
  Booking.new(
    :book_id => SecureRandom.hex(4),
    :member => Member.find(ixd%5+2),
    :date => Date.today - ixd,
    :from => 4,
    :to => 7,
    :room => Room.find(ixd%4+1)
  ).save(validate: false)
end
