ActiveAdmin.register User do
  filter :email_contains, label: "user's email"

  User.roles.each { |role| scope role[0].to_sym }

  index do
    selectable_column
    id_column
    column ("Full name") { |user| "#{user.first_name} #{user.last_name}"}
    column :email
    # column :current_sign_in_at
    # column :created_at
    # column :sign_in_count
    actions
  end

  permit_params :first_name, :last_name, :email ,:role , :password, :password_confirmation, :phone, :address, :city, :state, :zipcode

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :role
    end

    f.inputs do
      f.input :password
      f.input :password_confirmation
    end

    f.inputs do
      f.input :phone
      f.input :address
      f.input :city
      f.input :state
      f.input :zipcode
    end
    f.actions
  end
end
