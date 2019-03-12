class Doctor < ApplicationRecord
  belongs_to :user
  has_many :diagnoses

  validates :introduction, :profile_picture, :license, presence: true
  validates :license, uniqueness: true
end
