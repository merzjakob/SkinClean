class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :doctors, dependent: :destroy
  has_one :doctor
  has_many :diagnoses
  has_many :patient_answers
  has_many :undiagnosed_answers, -> { where(diagnosis_id: nil) }, class_name: "PatientAnswer"

  validates :first_name, :last_name, :email, :password, presence: true

  after_create :create_doctor, if: :is_doctor?

  def full_name
    "#{first_name} #{last_name}"
  end

  def finished_quiz?
    undiagnosed_answers.count == Question.count
  end

  def next_question
    Question.find do |question|
      !PatientAnswer.find_by(question_id: question.id, user_id: id)
    end
  end

  def answered_questions
    Question.joins(:patient_answers).where("patient_answers.user_id = ?", id)
  end

  private

  def create_doctor
    Doctor.create(user: self)
  end
end
