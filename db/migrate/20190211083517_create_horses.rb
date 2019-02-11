class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
      t.string :barn
      t.string :name
      t.integer :gender
      t.string :note
      t.references :user
      t.timestamps
    end
  end
end
