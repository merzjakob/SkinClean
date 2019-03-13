# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
PatientAnswer.destroy_all
Prescription.destroy_all
Diagnosis.destroy_all
Answer.destroy_all
Question.destroy_all
Medicine.destroy_all
Picture.destroy_all
Doctor.destroy_all
User.destroy_all

puts 'Creating users...'
user1 = User.create!(first_name: 'Jakob', last_name: 'Merz', email: 'jakob.merz@whu.edu', password: '123456', doctor: true)
user2 = User.create!(first_name: 'Antoine', last_name: 'Massot', email: 'antoine@massot.com', password: '123456', doctor: false)

puts 'Creating doctors...'
doctor1 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg', license: '1234', user: user1)

puts 'Creating questions..'
question1 = Question.create!(title: 'What is your name?', multiple_choice: false)
question2 = Question.create!(title: 'Do you have pain?', multiple_choice: true)
question3 = Question.create!(title: 'Is that bleeding?', multiple_choice: true)
question4 = Question.create!(title: 'Are you ashamed?', multiple_choice: true)

puts 'Creating answers...'
answer1 = Answer.create!(content: '', question: question1)
answer2 = Answer.create!(content: '', question: question1)
answer3 = Answer.create!(content: 'No', question: question2)
answer6 = Answer.create!(content: 'Yes', question: question2)
answer4 = Answer.create!(content: 'No', question: question3)
answer7 = Answer.create!(content: 'Yes', question: question3)
answer5 = Answer.create!(content: 'No', question: question4)
answer8 = Answer.create!(content: 'Yes', question: question4)

puts 'Creating medicines...'
medicine1 = Medicine.create!(name: 'Aspirin', description: 'This helps with hangovers', risk: 'drowning', price_per_unit: 3)
medicine2 = Medicine.create!(name: 'Ibuprofen', description: 'This helps with hangovers', risk: 'drowning', price_per_unit: 5)

puts 'Creating diagnosis...'
diagnosis1 = Diagnosis.create!(user: user2, doctor: doctor1, recommendation: 'Sorry, there is nothing I can do here', medical_assessment: 'this is bad!')

puts 'Creating patient answer...'
PatientAnswer.create!(question: question1, diagnosis: diagnosis1, user: user1, content: "Jakob")
PatientAnswer.create!(question: question2, diagnosis: diagnosis1, user: user1, content: answer3.content)

puts 'Creating prescription'
Prescription.create!(diagnosis: diagnosis1, medicine: medicine2)

puts 'Creating pictures..'
patient_pic1 = Picture.create!(diagnosis_picture: 'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/durchschnittsgesichter/m(01-32)_gr.jpg', diagnosis: diagnosis1)

puts 'Database seeded'
