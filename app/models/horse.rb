class Horse < ApplicationRecord
  belongs_to :user

  enum gender: [:female, :male]

  validates :barn, :name, :gender, :note, :color, presence: true

  before_validation :limit_horses, on: :create

  def limit_horses
    return false if user.nil?
    if user.has_tier?
      if user.is_forbidden?
        errors.add(:base, "You have only subscribe to #{user.tier_horse_count} horses.")
      else
        return true
      end
    else
      errors.add(:base, "You have no subscriptions.")
    end
    return false
  end
end
