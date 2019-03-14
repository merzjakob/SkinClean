class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :doctors, dependent: :destroy
  has_many :diagnoses
  has_many :patient_answers

  validates :first_name, :last_name, :email, :password, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
