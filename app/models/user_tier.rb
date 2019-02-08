class UserTier < ApplicationRecord
  belongs_to :user
  belongs_to :tier

  has_one :subscription
end
