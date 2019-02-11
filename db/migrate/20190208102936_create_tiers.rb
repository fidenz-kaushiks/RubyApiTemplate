class CreateTiers < ActiveRecord::Migration[5.2]
  def change
    create_table :tiers do |t|

      t.string :name
      t.text :description
      t.float :price
      t.integer :period
      t.integer :horses

      t.timestamps
    end
  end
end
