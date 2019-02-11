require "stripe"
module HorseStripe
  class Payment
    def initialize(user, tier, token)
      @user  = user
      @tier  = tier
      @token = token
    end

    def subscription(description)
      return HorseStripe::Subscribe.new(description, @tier, @user)
    end
  end

  class Subscribe
    def initialize(description, tier, user)
      @description = description
      @tier        = tier
      @stripe_subscription = Subscription.new
      @user = user
    end

    def create
      customer = create_customer
      plan     = create_plan
      if plan.nil?
        return false
      else
        @stripe_subscription.plan_id = plan[:id]
      end

      subscription = create_subscription(plan[:id], customer[:id])

      if subscription.nil?
        plan.delete
        customer.delete
        return false
      else
        @stripe_subscription.subscription_id = subscription[:id]
        if @stripe_subscription.save
          return true
        else
          subscription.delete
          return false
        end
      end
    end

    def get_subscription
      return Stripe::Subscription.retrieve(@stripe_subscription.subscription_id)
    end

    def get_plan
      return Stripe::Plan.retrieve(@stripe_subscription.plan_id)
    end

    def get_stripe_subscription
      return @stripe_subscription
    end

    def cancel_subscription
      return get_subscription.delete
    end

    def delete_plan
      return get_plan.delete
    end

    private

    def logerror(user = nil, error)
      print_logger.error(error)
    end

    def print_logger
      @@set_logger ||= Logger.new("log/paypal_payments.log")
    end

    def create_customer
      begin
        return Stripe::Customer.create(
          email: @user.email,
          description: "customer for #{description}",
          card: @token
        )
      rescue Exception => e
        logerror(@user, e)
        return nil
      end
    end

    def create_plan
      begin
        return Stripe::Plan.create(
          :amount => (@tier.price * 100).to_i,
          :currency => "aud",
          :interval => @tier.period,
          :product => {
            :name => "pId: #{@pass.id} user:#{@user.id} time:#{Time.now.to_i}"
          }
        )
      rescue Exception => e
        logerror(@user, e)
        return nil
      end
    end

    def create_subscription(plan, customer)
      begin
        return Stripe::Subscription.create(
          :customer => "#{customer}",
          :items => [
            {:plan => "#{plan}"
          }])
      rescue Exception => e
        logerror(@user, e)
        return nil
      end
    end
end
