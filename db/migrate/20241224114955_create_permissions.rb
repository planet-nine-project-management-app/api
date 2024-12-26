class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|
      t.string :tenant_id, null: false
      t.string :name, null: false
      t.string :scope, null:false
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end

  end
end
