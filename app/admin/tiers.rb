ActiveAdmin.register Tier do
  config.filters = false
  actions :all, except: [:new, :destroy]
  # Tier.periods.each { |period| scope period[0].to_sym }

  index do
    id_column
    column :name
    column :price
    column (:max_horses) { |tier| tier.horses}
    column :description
    column :updated_at
    actions
  end

  permit_params :name, :description

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      li class: 'text input required' do
        label 'Tier Price'
        div f.resource.price
      end
      li class: 'text input required' do
        label 'Maximum Horses'
        div f.resource.horses
      end
    end
    f.actions
  end

  show do
    attributes_table do
      rows :name
      rows :description
      rows :price
      rows :horses
      rows :updated_at
    end
  end
end
