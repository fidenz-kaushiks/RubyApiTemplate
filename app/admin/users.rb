# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :user_role

  index do
    selectable_column
    id_column
    column :email
    column :user_role
    column :current_sign_in_at
    column :created_at
    column :sign_in_count
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :user_role, :as => :select
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :user_role
    end
    f.actions
  end
end
