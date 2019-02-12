ActiveAdmin.register UserTier, as: 'Subscription' do
  config.filters = false
  Tier.periods.each { |period| scope period[0].to_sym }
  actions :all, except: [:new, :destroy, :edit]

  index do
    id_column
    column :user
    column :name
    column :price
    column :period
    actions
  end
end
