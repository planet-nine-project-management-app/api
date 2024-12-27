class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :tenant_id, null: false
      t.string :name, null: false
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
    
    add_index :roles, :name, unique: true
  end
end
