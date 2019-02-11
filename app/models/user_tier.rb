class UserTier < ApplicationRecord
  belongs_to :user
  belongs_to :tier

  has_one :subscription
  attribute :token

  after_create :create_subscription

  def create_subscription
    begin
      horse_stripe = HorseStripe::Payment.new(user, tier, token)
      stripe_subscription = horse_stripe.subscription("description")
      user_subscription = stripe_subscription.create

      if user_subscription
        subscription = Subscription.new
        subscription.plan_id = stripe_subscription.get_plan
        subscription.subscription_id = stripe_subscription.get_subscription
        subscription.status = Subscription.statuses[:active]
        if subscription.save!
        else
          if stripe_subscription.cancel_subscription
            if stripe_subscription.delete_plan
              raise ""
            else
              raise ""
            end
          else
          end
        end
      else
        
      end

      horse_stripe
    rescue Exception => e
    end
  end
end
