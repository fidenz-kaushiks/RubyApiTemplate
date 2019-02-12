class Tier < ApplicationRecord
  enum period: [:week, :month]

  has_many :user_tiers, dependent: :destroy

  validates :name, :description, :price, :period, :horses, presence: true

  validates :price, numericality: true
  validates :horses, numericality: { only_integer: true }

  after_save :update_user_tiers

  def update_user_tiers
  	self.user_tiers.each(&:save!)
  end
end
