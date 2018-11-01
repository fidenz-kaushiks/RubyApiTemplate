class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.string :role_name
      t.string :slug
      t.timestamps
    end
  end
end
