class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :file_name, null: false
      t.string :file_type, null: false
      t.string :byte_size, null: false
      t.references :imageable, polymorphic: true, null: false
      t.timestamps
    end

  end
end
