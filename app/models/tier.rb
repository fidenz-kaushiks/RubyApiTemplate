class Tier < ApplicationRecord
  enum period: [:weekly, :monthly]

  validates :name, :description, :price, :period, :horses, presence: true

  validates :price, numericality: true
  validates :horses, numericality: { only_integer: true }
end
