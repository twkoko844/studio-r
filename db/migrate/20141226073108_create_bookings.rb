class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :book_id
      t.references :member
      t.date :date
      t.integer :from
      t.integer :to
      t.references :room
      t.timestamps
    end
    add_index :bookings, :member_id
    add_index :bookings, :room_id
  end
end
