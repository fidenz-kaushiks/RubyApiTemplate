ActiveAdmin.register Horse do
  belongs_to :user
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
    f.inputs do
      f.input :barn
      f.input :name
      f.input :gender
      f.input :note
      f.input :user
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
