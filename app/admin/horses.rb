ActiveAdmin.register Horse do
  belongs_to :user
  # actions :all, except: [:new, :destroy, :edit]
  filter :name_contains, label: "Horse name"

  permit_params :barn, :name, :gender, :note, :user

  index do
    selectable_column
    id_column
    column :barn
    column :name
    column :gender
    column :user
    actions
  end

  form do |f|
    f.semantic_errors(*f.object.errors[:base].first)

    f.inputs do
      f.input :barn
      f.input :name
      f.input :gender
      f.input :note
      li class: 'text input required' do
        label 'user'
        div f.resource.user.full_name
      end
    end
    f.actions
  end

  show do
    attributes_table do
      rows :barn
      rows :name
      rows :gender
      rows :note
      rows :user
      rows :created_at
      rows :updated_at
    end
  end
end
