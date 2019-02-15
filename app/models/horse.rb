class Horse < ApplicationRecord
  belongs_to :user

  enum gender: [:female, :male]

  validates :barn, :name, :gender, :note, presence: true

  before_validation :limit_horses

  def limit_horses
    if user.has_tier?
      if (user.horse_count < user.tier_horse_count)
        return true
      else
        errors.add(:base, "#{user.full_name} has only subscribe to #{user.tier_horse_count} horses.")
      end
    else
      errors.add(:base, "#{user.full_name} has no subscriptions.")
    end
    return false
  end
end
