class CreateUserProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :user_projects do |t|
      t.references :user, null: false, foreign_key: true, unique: true
      t.references :project, null: false, foreign_key: true, unique: true
      t.string :tenant_id, null: false
      t.string :role_in_project
      t.timestamps
    end

  end
end
