class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
