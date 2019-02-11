ActiveAdmin.register User do
  filter :email_contains, label: "user's email"

  User.roles.each { |role| scope role[0].to_sym }

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    if(params[:scope].nil? || params[:scope]=='member')
      column(:horses) do |user|
        link_to(user.horses.count, admin_user_horses_path(user.id))
      end
    end
    column :current_sign_in_at
    column :created_at
    column :sign_in_count
    actions
  end

  permit_params :first_name, :last_name, :email ,:role ,:phone, :address, :city, :state, :zipcode

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :role
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

  show do
    attributes_table do
      rows :first_name
      rows :last_name
      rows :email
      rows :role
      rows :phone
      rows :address
      rows :city
      rows :state
      rows :zipcode
    end
  end
end
