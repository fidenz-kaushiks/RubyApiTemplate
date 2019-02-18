class AddHorseColour < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :color, :string
  end
end
