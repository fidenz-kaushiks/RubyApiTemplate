class CreateUserTiers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tiers do |t|

      t.string :name
      t.text :description
      t.float :price
      t.integer :period
      t.integer :horses

      t.references :user
      t.references :tier

      t.timestamps
    end
  end
end
