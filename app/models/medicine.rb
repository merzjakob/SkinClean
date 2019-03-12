class Medicine < ApplicationRecord
  has_many :prescriptions

  validates :name, :description, :risk, :price_per_unit, presence: true
  validates :name, uniqueness: true
end
