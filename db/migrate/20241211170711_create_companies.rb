class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :description
      t.string :theme
      t.string :logo_url
      t.string :tenant_id, null: false  
      t.timestamps
    end

    add_index :companies, :name, unique: true
  end
end
