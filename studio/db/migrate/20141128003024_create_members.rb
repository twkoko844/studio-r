class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :hashed_password, null: false
      t.string :tel
      t.string :email
      t.boolean :admin, null: false, default: false
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
