ActiveAdmin.register UserTier, as: 'Subscription' do
  actions :all, except: [:new, :destroy, :edit]

  index do
    id_column
    column :user
    column :name
    column :price
    column :created_at
    actions
  end

  show do
    attributes_table do
      rows :user
      rows :name
      rows :price
      rows :created_at
    end
  end
end
