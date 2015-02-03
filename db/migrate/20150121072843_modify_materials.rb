class ModifyMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :suspend, :boolean, default: false
  end
end
