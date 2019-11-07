class AddStripeIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :sub_id, :string
  end
end
