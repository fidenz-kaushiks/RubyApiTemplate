ActiveAdmin.register User do
  filter :first_name_or_last_name_cont, as: :string, label: "Name"
  filter :email_contains, label: "email address"

  # User.roles.each { |role| scope role[0].to_sym }

  index do
    selectable_column
    id_column
    column :full_name
    column :email
    if(params[:scope].nil? || params[:scope]=='member')
      column(:horses) do |user|
        if user.has_tier?
          link_to(user.horses.count, admin_user_horses_path(user))
        else
          "--"
        end
      end
      column(:subscription) do |user|
        if user.has_tier?
          link_to(user.user_tier.name, admin_subscription_path(user.user_tier))
        else
          "--"
        end
      end
    end
    column :current_sign_in_at
    column :created_at
    column :sign_in_count
    actions
  end

  permit_params :first_name, :last_name, :email ,:password, :password_confirmation, :phone, :address, :city, :state, :zipcode, :subscription, :status

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email

    if f.object.new_record?
      f.inputs do
        f.input :password
        f.input :password_confirmation
      end
    end

      f.input :phone
      f.input :address
      f.input :city
      f.input :state
      f.input :zipcode
    end

    if f.object.new_record?
      f.inputs do
        f.input :subscription, as: :select, collection: Tier.all.map { |t| [t.name, t.id] }
      end
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
      row ('subscription') do
        user.has_tier? ? user.user_tier : '--'
      end
      rows :created_at
      rows :updated_at
    end
  end
end
