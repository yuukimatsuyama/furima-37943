class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
        t.string      :address_number,      null:false
        t.integer     :prefecture_id,       null:false
        t.string      :municipality,        null:false
        t.string      :address,             null:false
        t.string      :building_name
        t.string      :phone_number,        null:false
        t.references  :buying_item,         null: false, foreign_key: true

  
      t.timestamps
    end
  end
end
