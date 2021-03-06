# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_19_135627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.text "medical_assessment"
    t.text "recommendation"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["doctor_id"], name: "index_diagnoses_on_doctor_id"
    t.index ["user_id"], name: "index_diagnoses_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.text "introduction"
    t.string "profile_picture"
    t.string "license"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "risk"
    t.integer "price_per_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "medicine_picture"
  end

  create_table "patient_answers", force: :cascade do |t|
    t.bigint "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_id"
    t.bigint "user_id"
    t.text "content"
    t.string "photo"
    t.index ["diagnosis_id"], name: "index_patient_answers_on_diagnosis_id"
    t.index ["question_id"], name: "index_patient_answers_on_question_id"
    t.index ["user_id"], name: "index_patient_answers_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "diagnosis_id"
    t.bigint "medicine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_prescriptions_on_diagnosis_id"
    t.index ["medicine_id"], name: "index_prescriptions_on_medicine_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "title"
    t.boolean "multiple_choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "photo", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_doctor", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "diagnoses", "doctors"
  add_foreign_key "diagnoses", "users"
  add_foreign_key "doctors", "users"
  add_foreign_key "patient_answers", "diagnoses"
  add_foreign_key "prescriptions", "diagnoses"
  add_foreign_key "prescriptions", "medicines"
end
