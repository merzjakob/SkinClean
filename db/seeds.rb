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
Doctor.destroy_all
User.destroy_all

puts 'Creating users...'
user1 = User.create!(first_name: 'Jakob', last_name: 'Merz', email: 'jakob.merz@whu.edu', password: '123456', is_doctor: true)
user2 = User.create!(first_name: 'Antoine', last_name: 'Massot', email: 'antoine@massot.com', password: '123456', is_doctor: false)
user3 = User.create!(first_name: 'Augustin', last_name: 'Uyttenhove', email: 'augustin@Uyttenhove.com', password: '123456', is_doctor: false)
user4 = User.create!(first_name: 'Bruce', last_name: 'Willis', email: 'bwillis@skinclean.xyz', password: '123456', is_doctor: true)
user5 = User.create!(first_name: 'John', last_name: 'Doe', email: 'jdoe@skinclean.xyz', password: '123456', is_doctor: true)

puts 'Creating doctors...'
doctor1 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg', license: '1234', user: user1, address: "Barcelona")
doctor2 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg', license: '1234', user: user4, address: "Madrid")
doctor3 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg', license: '1234', user: user5, address: "Paris")

puts 'Creating questions..'
question1 = Question.create!(title: "Hi, my name is Jude. I am SkinClean's chatbot and I will personally assist you in getting discrete, professional advice for your skin problems. What should I call you throughout this process?", multiple_choice: false)
question2 = Question.create!(title: 'What percentage of your face would you say is covered in acne scars?', multiple_choice: true)
question3 = Question.create!(title: 'How often do you have deep, painful nodules on your face?', multiple_choice: true)
question4 = Question.create!(title: 'How often do you have painful nodules on areas of your body other than your face?', multiple_choice: true)
question5 = Question.create!(title: 'How much of your face is covered with pus-filled blemishes?', multiple_choice: true)
question6 = Question.create!(title: 'What percentage of your face is covered with blackheads or whiteheads?', multiple_choice: true)
question7 = Question.create!(title: 'How much of your face is covered with red blemishes without pus?', multiple_choice: true)
question8 = Question.create!(title: 'Please upload a photo', multiple_choice:false, photo:true)

puts 'Creating text answers'
answer1 = Answer.create!(content: '', question: question1)
answer2 = Answer.create!(content: '', question: question8)
answer3 = Answer.create!(content: '', question: question1)
puts 'Creating Q2 answers'
answer4 = Answer.create!(content: 'More than 25%', question: question2)
answer5 = Answer.create!(content: "Between 10% and 25%", question: question2)
answer6 = Answer.create!(content: 'Less than 10%', question: question2)
answer7 = Answer.create!(content: "I don't have any acne scars", question: question2)
puts 'Creating Q3 answers'
answer8 = Answer.create!(content: 'Every day', question: question3)
answer9 = Answer.create!(content: 'For a week or two each month', question: question3)
answer10 = Answer.create!(content: 'Every couple of months', question: question3)
answer11 = Answer.create!(content: 'Never', question: question3)
puts 'Creating Q4 answers'
answer12 = Answer.create!(content: 'Every day', question: question4)
answer13 = Answer.create!(content: 'For a week or two each month', question: question4)
answer14 = Answer.create!(content: 'Every couple of months', question: question4)
answer15 = Answer.create!(content: 'Never', question: question4)
puts 'Creating Q5 answers'
answer16 = Answer.create!(content: 'More than 25%', question: question5)
answer17 = Answer.create!(content: "Between 10% and 25%", question: question5)
answer18 = Answer.create!(content: "Less than 10%", question: question5)
answer19 = Answer.create!(content: "I don't have any red bumps that are filled with pus", question: question5)
puts 'Creating Q6 answers'
answer20 = Answer.create!(content: "More than 25%", question: question6)
answer21 = Answer.create!(content: "Between 10% and 25%", question: question6)
answer22 = Answer.create!(content: "Less than 10%", question: question6)
answer23 = Answer.create!(content: "I don't have blackhead or whiteheads", question: question6)
puts 'Creating Q7 answers'
answer24 = Answer.create!(content: "More than 25%", question: question7)
answer25 = Answer.create!(content: "Between 10% and 25%", question: question7)
answer26 = Answer.create!(content: "Less than 10%", question: question7)
answer27 = Answer.create!(content: "I don't have any red bumps without pus", question: question7)
puts 'All answers created!'


puts 'Creating medicines...'
medicine1 = Medicine.create!(name: 'Aspirin', description: 'This helps with hangovers', risk: 'drowning', price_per_unit: 3, medicine_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg')
medicine2 = Medicine.create!(name: 'Ibuprofen', description: 'This helps with hangovers', risk: 'drowning', price_per_unit: 5, medicine_picture: 'https://hcplive.s3.amazonaws.com/v1_media/_image/happydoctor.jpg')

puts 'Creating diagnosis...'
diagnosis1 = Diagnosis.create!(user: user2, doctor: doctor1, recommendation: 'Sorry, there is nothing I can do here', medical_assessment: 'this is bad!')
diagnosis1 = Diagnosis.create!(user: user2, doctor: doctor1, recommendation: 'Several home remedies and over-the-counter medications can treat minor-to-mild papules and pustules. The following tips can help: Washing the affected area with cool water and soap using clean hands or a clean, gentle facecloth twice a day. Applying a warm compress or cloth - available to buy in pharmacies and online - to the affected area for 10–15 minutes to encourage trapped debris to rise to the surface. Using products with benzoyl peroxide to combat bacteria. Using products with salicylic acid to remove dead skin cells and other debris', medical_assessment: 'Most active ingredients in over-the-counter products are available in prescription-strength treatments. Dermatologists can also remove lesions that are very large or persistent. They can also remove those that do not respond to other forms of treatment. Always see a doctor or dermatologist about nodules and cysts, because these require medical care. Untreated nodules and cysts and those that have been picked or popped can cause scarring.', status: 'Diagnosed')

puts 'Creating patient answer...'
PatientAnswer.create!(question: question1, diagnosis: diagnosis1, user: user1, content: "Jakob")
PatientAnswer.create!(question: question2, diagnosis: diagnosis1, user: user1, content: answer4.content)
PatientAnswer.create!(question: question5, diagnosis: diagnosis1, user: user1, content: answer8.content, photo:'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/durchschnittsgesichter/m(01-32)_gr.jpg' )

puts 'Creating prescription'
Prescription.create!(diagnosis: diagnosis1, medicine: medicine2)

puts 'Database seeded'

# We are about to mount on a three step journey:
#   I will ask you some question to classify your condition.
#   Then I will ask you to upload a picture of your face. This part is very important for a good diagnosis. Then one of our doctors will give you a professional opinion on your next steps and recommended medicine. Ready? Let's start!
