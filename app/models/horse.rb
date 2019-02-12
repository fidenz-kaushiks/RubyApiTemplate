class Horse < ApplicationRecord
  belongs_to :user

  enum gender: [:female, :male]

  validates :barn, :name, :gender, :note, presence: true

  before_validation :limit_horses

  def limit_horses
    if user.has_tier?
      if (user.horse_count <= 1)
        return true
      else
        errors.add(:user, "")
      end
    else
      errors.add(:base, "Too many answers.")
    end
    return false
  end
end
