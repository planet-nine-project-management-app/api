# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_24_115423) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "theme"
    t.string "logo_url"
    t.string "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "deliverables", force: :cascade do |t|
    t.string "tenant_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "due_date"
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_deliverables_on_name"
    t.index ["project_id"], name: "index_deliverables_on_project_id"
    t.index ["status"], name: "index_deliverables_on_status"
    t.index ["user_id", "project_id"], name: "index_deliverables_on_user_id_and_project_id"
    t.index ["user_id"], name: "index_deliverables_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file_name", null: false
    t.string "file_type", null: false
    t.string "byte_size", null: false
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "tenant_id", null: false
    t.string "name", null: false
    t.string "scope", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "tenant_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "status", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_projects_on_company_id"
    t.index ["name"], name: "index_projects_on_name"
    t.index ["status"], name: "index_projects_on_status"
  end

  create_table "roles", force: :cascade do |t|
    t.string "tenant_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.string "tenant_id", null: false
    t.string "role_in_project"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id"
    t.index ["user_id", "project_id"], name: "index_user_projects_on_user_id_and_project_id", unique: true
    t.index ["user_id"], name: "index_user_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "role", null: false
    t.string "tenant_id", null: false
    t.string "jti", default: "5832a91c-ed03-478e-9d76-2c2eea38c156", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  add_foreign_key "deliverables", "projects"
  add_foreign_key "deliverables", "users"
  add_foreign_key "permissions", "users"
  add_foreign_key "projects", "companies"
  add_foreign_key "roles", "users"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
end
