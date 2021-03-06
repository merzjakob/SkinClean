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
user1 = User.create!(first_name: 'Dr.', last_name: 'House', email: 'house@skinclean.xyz', password: '123456', is_doctor: true)
user2 = User.create!(first_name: 'Antoine', last_name: 'Massot', email: 'antoine@massot.com', password: '123456', is_doctor: false)
user3 = User.create!(first_name: 'Augustin', last_name: 'Uyttenhove', email: 'augustin@Uyttenhove.com', password: '123456', is_doctor: false)
user4 = User.create!(first_name: 'Dr.', last_name: 'Grey', email: 'dross@skinclean.xyz', password: '123456', is_doctor: true)
user5 = User.create!(first_name: 'Dr. Derek Christopher', last_name: 'Shepherd', email: 'dshepherd@skinclean.xyz', password: '123456', is_doctor: true)
user6 = User.create!(first_name: 'Dr.', last_name: 'Dolittle', email: 'dolittle@skinclean.xyz', password: '123456', is_doctor: true)
user7 = User.create!(first_name: 'Dr. Patch', last_name: 'Adams', email: 'padams@skinclean.xyz', password: '123456', is_doctor: true)
user8 = User.create!(first_name: 'Dr.', last_name: 'Strange', email: 'strange@skinclean.xyz', password: '123456', is_doctor: true)
user9 = User.create!(first_name: 'Jakob', last_name: 'Merz', email: 'jm@skinclean.xyz', password: '123456', is_doctor: false)

puts 'Creating doctors...'
doctor1 = Doctor.create!(introduction: 'I am a pro!', profile_picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuZNI10enj-AaAluxnWEI7R15yUy0esuqb44t44kM-3mr_Nc-MCw', license: '1234', user: user1, address: "Carrer d'en grassot 101", city: "Barcelona")
doctor2 = Doctor.create!(introduction: 'I am here for you!', profile_picture: 'https://s-cdn.serienjunkies.de/greys-anatomy/dr--meredith-grey.jpg', license: '1234', user: user4, address: "Carrer de Mallorca 401, Barcelona", city: "Barcelona")
doctor3 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://i.skyrock.net/5990/60545990/pics/2438759609_1.jpg', license: '1234', user: user5, address: "Carrer de la Marina 212", city: "Barcelona")
doctor4 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://d1jo0zet24jmxt.cloudfront.net/content/14898/2fd6c5914cc444a3adf19813635f60de.jpg', license: '1234', user: user6, address: "26 Avenue de l'Opéra", city: "Paris")
doctor5 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://musicart.xboxlive.com/7/e5b61000-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080', license: '1234', user: user7, address: "Plaza Canovas del Castillo 5", city: "Madrid")
doctor6 = Doctor.create!(introduction: 'I am a good doctor', profile_picture: 'https://vignette.wikia.nocookie.net/disney/images/5/55/Doctor_Strange.jpg/revision/latest?cb=20180426213411&path-prefix=es', license: '1234', user: user8, address: "Pariser Platz 4A", city: "Berlin")

puts 'Creating questions..'
question1 = Question.create!(title: "Hi, my name is Judy. I am SkinClean's chatbot and I will personally assist you in getting discrete, professional advice for your skin problems. So no need to feel embarassed. We can help you.<strong> Whenever you are ready type 'Go'?</strong>", multiple_choice: false)
question2 = Question.create!(title: '<p class="message">Great, let us start with the first question: <br> <strong>What percentage of your face would you say is covered in acne scars?</strong></p>', multiple_choice: true)
question3 = Question.create!(title: '<p class="message">Thanks for the answer! Our doctors will provide you with individualized assessments after submitting your information.<br> <strong> How often do you have deep, painful nodules on your face?</strong></p>', multiple_choice: true)
question4 = Question.create!(title: '<p class="message"><strong>How often do you have painful nodules on areas of your body other than your face?</strong></p>', multiple_choice: true)
# question5 = Question.create!(title: '<p class="message">Thank you, facial scars significantly impair life quality, but we can actively do something against them. <br> <strong>How much of your face is covered with pus-filled blemishes?</strong></p>', multiple_choice: true)
question6 = Question.create!(title: '<p class="message">We are almost there, only two more questions! <br> <strong>What percentage of your face is covered with blackheads or whiteheads?</strong></p>', multiple_choice: true)
question7 = Question.create!(title: '<p class="message">Did you know that acne is the most common skin condition in the US? You are not alone and we are here to help you. For the final question could you please tell me <br><strong> how much of your face is covered with red blemishes without pus?</strong></p>', multiple_choice: true)
question8 = Question.create!(title: '<p class="message">Thank you for your trust, we will now ask you to <strong>upload a picture </strong>to allow for the creation of an optimal, personalized diagnosis. Whenever you are ready, take the picture and submit for diagnosis</p>', multiple_choice:false, photo:true)

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
# puts 'Creating Q5 answers'
# answer16 = Answer.create!(content: 'More than 25%', question: question5)
# answer17 = Answer.create!(content: "Between 10% and 25%", question: question5)
# answer18 = Answer.create!(content: "Less than 10%", question: question5)
# answer19 = Answer.create!(content: "I don't have any red bumps filled with pus", question: question5)
puts 'Creating Q6 answers'
answer20 = Answer.create!(content: "More than 25%", question: question6)
answer21 = Answer.create!(content: "Between 10% and 25%", question: question6)
answer22 = Answer.create!(content: "Less than 10%", question: question6)
answer23 = Answer.create!(content: "I don't have blackhead or whiteheads", question: question6)
puts 'Creating Q7 answers'
answer24 = Answer.create!(content: "More than 25%", question: question7)
answer25 = Answer.create!(content: "Between 10% and 25%", question: question7)
answer26 = Answer.create!(content: "Less than 10%", question: question7)
answer27 = Answer.create!(content: "I don't have red bumps without pus", question: question7)
puts 'All answers created!'


puts 'Creating medicines...'
medicine1 = Medicine.create!(name: 'Acanya Gel', description: "Acanya Gel is a prescription medication that contains two acne-fighting ingredients: benzoyl peroxide and clindamycin.  It’s used to treat mild to moderate inflammatory breakouts, as well as severe acne.  It helps improve bumps and blackheads too.", risk: "The side effects are pretty typical of most topical acne medications: mild itching, burning, and dryness.
  The side effects are usually worse during the first few weeks of treatment, and peak about week four.  The good news is, dryness and irritation slowly subside over time and after about three months or so your skin is back to where it was before you started treatment (but most likely, with fewer breakouts).", price_per_unit: 3, medicine_picture: 'https://www.empr.com/wp-content/uploads/sites/7/2018/12/acanya_pump_photo_204476.jpg')
medicine2 = Medicine.create!(name: 'Benzamycin', description: "Benzamycin gel is applied topically to all areas affected by acne. It works by killing the Propionibacterium acnes (P. acnes). Benzamycin seems to have the greatest effect on inflammatory acne breakouts, such as papules and pustules.
It may take a while before you start noticing improvement of the skin, so don't give up on your medication too quickly. You may find your acne actually gets a bit worse before getting better.", risk: "Like most acne medications, the most common side effect of Benzamycin is dryness and peeling. Other side effects can include: stinging, burning or itching, redness, and irritation, increased sensitivity to the sun, skin discoloration (hyperpigmentation or hypopigmentation)", price_per_unit: 5, medicine_picture: 'https://yoderm.com/media/cms_page_media/198/epiduo-pump.jpg')
medicine3 = Medicine.create!(name: 'Differin', description: "Benzamycin gel is applied topically to all areas affected by acne. It works by killing the Propionibacterium acnes (P. acnes). Benzamycin seems to have the greatest effect on inflammatory acne breakouts, such as papules and pustules.
It may take a while before you start noticing improvement of the skin, so don't give up on your medication too quickly. You may find your acne actually gets a bit worse before getting better.", risk: "Like most acne medications, the most common side effect of Benzamycin is dryness and peeling. Other side effects can include: stinging, burning or itching, redness, and irritation, increased sensitivity to the sun, skin discoloration (hyperpigmentation or hypopigmentation)", price_per_unit: 8, medicine_picture: 'https://yoderm.com/media/cms_page_media/198/epiduo-pump.jpg')


puts 'Creating diagnosis...'
diagnosis1 = Diagnosis.create!(user: user9, doctor: doctor1, recommendation: ' <p>I recommend washing your face once or twice a day using a mild facial cleanser and lukewarm water. Furthermore, you should apply topical products that come in gels, creams, solutions and lotions. <strong>I have provided a selection of products below.</strong> If that does not help significantly within the next two weeks, please go through the SkinClean assessment process again to see the progress and provide you with some oral antibiotics, if needed.</p>', medical_assessment: 'You seem to have Acne vulgaris characterized by comedones, papules, pustules, and nodules in the face. A comedone is a whitehead (closed comedone) or a blackhead (open comedone). You do not have any clinical signs of inflammation.', status: 'Diagnosed')

puts 'Creating patient answer...'
PatientAnswer.create!(question: question1, diagnosis: diagnosis1, user: user1, content: "Jakob")
PatientAnswer.create!(question: question2, diagnosis: diagnosis1, user: user1, content: answer4.content)
PatientAnswer.create!(question: question8, diagnosis: diagnosis1, user: user1, content: answer8.content, photo:'https://www.uni-regensburg.de/Fakultaeten/phil_Fak_II/Psychologie/Psy_II/beautycheck/english/durchschnittsgesichter/m(01-32)_gr.jpg' )

puts 'Creating prescription'
Prescription.create!(diagnosis: diagnosis1, medicine: medicine2)

puts 'Database seeded'

# We are about to mount on a three step journey:
#   I will ask you some question to classify your condition.
#   Then I will ask you to upload a picture of your face. This part is very important for a good diagnosis. Then one of our doctors will give you a professional opinion on your next steps and recommended medicine. Ready? Let's start!
