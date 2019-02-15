ActiveAdmin.register UserTier, as: 'Subscription' do
  config.filters = false
  actions :all, except: [:new, :destroy, :edit]

  index do
    id_column
    column :user
    column :name
    column :price
    column (:max_horses) { |tier| tier.horses }
    column :created_at
    actions
  end

  show do
    attributes_table do
      rows :user
      rows :name
      rows :price
      rows :horses
      rows :created_at
    end
  end
end
