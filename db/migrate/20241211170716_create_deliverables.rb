class CreateDeliverables < ActiveRecord::Migration[7.1]
  def change
    create_table :deliverables do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :due_date
      t.integer :status, null: false
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end

    add_index :deliverables, :name
    add_index :deliverables, :status
    add_index :deliverables, [:user_id, :project_id]
  end
end
