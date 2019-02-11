class Horse < ApplicationRecord
  belongs_to :user

  enum gender: [:female, :male]

  validates :barn, :name, :gender, :note, presence: true
end
