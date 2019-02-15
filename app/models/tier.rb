class Tier < ApplicationRecord
  enum period: [:week, :month]

  has_many :user_tiers, dependent: :destroy

  validates :name, :price, :period, :horses, presence: true
  validates :description, presence: true, length: { maximum: 110 }

  validates :price, numericality: true
  validates :horses, numericality: { only_integer: true }

  after_save :update_user_tiers
  after_initialize :set_defaults, unless: :persisted?

  def update_user_tiers
  	self.user_tiers.each(&:save!)
  end

  private

  def set_defaults
    self.period ||= self.class.periods[:month]
  end
end
