class CreateShippingOrigins < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_origins do |t|

      t.timestamps
    end
  end
end
