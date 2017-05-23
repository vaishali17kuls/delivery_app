class AddInfoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :info, :string
  end
end
