class UserTier < ApplicationRecord
  belongs_to :user
  belongs_to :tier

  enum period: Tier.periods

  has_one :subscription
  attribute :token

  before_save :add_tier_data
  after_commit :inactive_users, on: :destroy

  private

  def add_tier_data
    self.name        = tier.name
    self.description = tier.description
    self.price  = tier.price
    self.period = tier.period
    self.horses = tier.horses
  end

  def inactive_users
    user.update_attribute(:status, User.statuses[:active])
  end
end
