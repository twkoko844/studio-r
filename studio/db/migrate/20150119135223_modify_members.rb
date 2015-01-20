class ModifyMembers < ActiveRecord::Migration
  def change
    add_column :members, :suspend, :boolean, default: false
  end
end
