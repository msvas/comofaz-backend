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

ActiveRecord::Schema[7.0].define(version: 2022_06_23_185210) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.bigint "question_instructor_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_instructor_id"], name: "index_chats_on_question_instructor_id"
  end

  create_table "instructor_subject_topics", force: :cascade do |t|
    t.bigint "instructor_id", null: false
    t.bigint "subject_topic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_instructor_subject_topics_on_instructor_id"
    t.index ["subject_topic_id"], name: "index_instructor_subject_topics_on_subject_topic_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "question_instructors", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "instructor_id", null: false
    t.boolean "instructor_marked_solved", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_question_instructors_on_instructor_id"
    t.index ["question_id"], name: "index_question_instructors_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subject_topic_id"
    t.text "description"
    t.integer "status", default: 0
    t.integer "solver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_topic_id"], name: "index_questions_on_subject_topic_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "subject_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.index ["subject_id"], name: "index_subject_areas_on_subject_id"
  end

  create_table "subject_topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_area_id"
    t.index ["subject_area_id"], name: "index_subject_topics_on_subject_area_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.string "phone"
    t.string "cpf"
    t.integer "status", default: 0
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_instructor", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "chats", "question_instructors"
  add_foreign_key "instructor_subject_topics", "instructors"
  add_foreign_key "instructor_subject_topics", "subject_topics"
  add_foreign_key "instructors", "users"
  add_foreign_key "question_instructors", "instructors"
  add_foreign_key "question_instructors", "questions"
  add_foreign_key "questions", "subject_topics"
  add_foreign_key "questions", "users"
  add_foreign_key "subject_areas", "subjects"
  add_foreign_key "subject_topics", "subject_areas"
end
