class ChangeColumnToOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :order_id, :string #using: 'order_id::integer'
  end
end
