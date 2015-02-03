class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :material_kind
      t.string :name
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
