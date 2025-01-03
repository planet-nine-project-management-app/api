class CreateDeliverables < ActiveRecord::Migration[7.1]
  def change
    create_table :deliverables do |t|
      t.string :tenant_id, null: false
      t.string :name, null: false
      t.text :description
      t.datetime :due_date
      t.integer :status, null: false
      t.references :user, null: false, foreign_key: true, unique: true
      t.references :project, null: false, foreign_key: true, unique: true

      t.timestamps
    end

    add_index :deliverables, :name
    add_index :deliverables, :status
  end
end
