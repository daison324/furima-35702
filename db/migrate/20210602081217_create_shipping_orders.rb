class CreateShippingOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_orders do |t|

      t.timestamps
    end
  end
end
