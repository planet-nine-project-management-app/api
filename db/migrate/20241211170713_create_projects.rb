class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end

    add_index :projects, :name
    add_index :projects, :status
  end
end
