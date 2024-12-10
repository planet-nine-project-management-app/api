class CreateDeliverables < ActiveRecord::Migration[7.1]
  def change
    create_table :deliverables do |t|
      t.string :name
      t.text :description
      t.datetime :due_date
      t.integer :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
