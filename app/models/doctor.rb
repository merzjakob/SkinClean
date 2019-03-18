class Doctor < ApplicationRecord
  belongs_to :user
  has_many :diagnoses

  validates :introduction, :profile_picture, :license, presence: true, on: :update
  validates :license, uniqueness: true, on: :update
end
