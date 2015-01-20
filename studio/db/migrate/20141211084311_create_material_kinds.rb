class CreateMaterialKinds < ActiveRecord::Migration
  def change
    create_table :material_kinds do |t|
      t.string :name
      t.timestamps
    end
    add_index :materials, :material_kind_id
  end
end
