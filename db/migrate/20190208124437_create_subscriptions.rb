class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|

    	t.string :plan_id
      t.string :subscription_id
      t.integer :status

      t.references :user_tier

      t.timestamps
    end
  end
end
