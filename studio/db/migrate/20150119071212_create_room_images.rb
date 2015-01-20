class CreateRoomImages < ActiveRecord::Migration
  def change
    create_table :room_images do |t|
      t.references :room, null: false
      t.binary :data
      t.string :content_type
      t.timestamps
    end

    add_index :room_images, :room_id
  end
end
