class CreateBookedmaterials < ActiveRecord::Migration
  def change
    create_table :bookedmaterials do |t|
      t.references :booking
      t.references :material
      t.timestamps
    end

    add_index :bookedmaterials, :booking_id
    add_index :bookedmaterials, :material_id
  end
end
