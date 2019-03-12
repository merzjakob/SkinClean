# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Answer.destroy_all
Question.destroy_all
Medicine.destroy_all
Picture.destroy_all
Patient_answer.destroy_all
Prescription.destroy_all
Diagnosis.destroy_all
User.destroy_all

puts 'Creating users...'
user1 = User.create!(first_name: 'Jakob', last_name: 'Merz', email: 'jakob.merz@whu.edu', encrypted_password: '12345', doctor: true)
user2 = User.create!(first_name: 'Antoine', last_name: 'Massot', email: 'antoine@massot.com', encrypted_password: '12345', doctor: false)

puts 'Creating doctors...'
doctor1 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg', license: '1234', user: user1)

puts 'Creating questions..'
question1 = Question.create!(question: 'What is your name?', multiple_choice: false)

puts 'Creating answers...'
answer1 = Answer.create!(content: 'Jakob', question: question1)
answer2 = Answer.create!(content: 'Augustine', question: question1)

puts 'Creating pictures..'
patient_pic1 = Picture.create!(diagnosis_picture: 'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/durchschnittsgesichter/m(01-32)_gr.jpg')

puts 'Creating medicines...'
medicine1 = Medicine.create!(name: 'Aspirin', description: 'This helps with hangovers', risk: 'drowning', price_per_unit: 3)
medicine2 = Medicine.create!(name: 'Ibuprofen', description: 'This helps with hangovers', risk: 'drowning', price_per_unit: 5)

puts 'Creating diagnosis...'
diagnosis1 = Diagnosis.create!(user: = user2, doctor: doctor1, picture: patient_pic1, medical_assessment: 'This looks ugly af', recommendation: 'Sorry, there is nothing I can do here')

puts 'Creating patient answer...'
Patient_answer.create!(answer: answer1, diagnosis: diagnosis1)

puts 'Creating prescription'
Prescription.create!(diagnosis: diagnosis1, medicine: medicine2)




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
    t.bigint "picture_id"
    t.text "medical_assessment"
    t.text "recommendation"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_diagnoses_on_doctor_id"
    t.index ["picture_id"], name: "index_diagnoses_on_picture_id"
    t.index ["user_id"], name: "index_diagnoses_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.text "introduction"
    t.string "profile_picture"
    t.string "license"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "risk"
    t.integer "price_per_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_answers", force: :cascade do |t|
    t.bigint "answer_id"
    t.bigint "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_patient_answers_on_answer_id"
    t.index ["diagnosis_id"], name: "index_patient_answers_on_diagnosis_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "diagnosis_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text "question"
    t.boolean "multiple_choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "doctor", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
