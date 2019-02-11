ActiveAdmin.register Tier do
  filter :name_contains, label: "Tier name"
  Tier.periods.each { |period| scope period[0].to_sym }

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :horses
    actions
  end

  permit_params :name, :description, :price, :period, :horses

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :period
      f.input :horses
    end
    f.actions
  end

  show do
    attributes_table do
      rows :name
      rows :description
      rows :price
      rows :period
      rows :horses
    end
  end
end
