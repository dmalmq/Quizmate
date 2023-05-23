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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_055709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "streak"
    t.integer "total_asked"
    t.datetime "last_asked"
    t.bigint "correct_option_id"
    t.bigint "user_option_id"
    t.bigint "interest_id", null: false
    t.bigint "quiz_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.boolean "corrected"
    t.index ["correct_option_id"], name: "index_questions_on_correct_option_id"
    t.index ["interest_id"], name: "index_questions_on_interest_id"
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
    t.index ["user_option_id"], name: "index_questions_on_user_option_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "number_of_question"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_points"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "interests", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "interests"
  add_foreign_key "questions", "options", column: "correct_option_id"
  add_foreign_key "questions", "options", column: "user_option_id"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "users"
end
