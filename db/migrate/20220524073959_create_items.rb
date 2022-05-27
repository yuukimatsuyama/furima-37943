class CreateItems < ActiveRecord::Migration[6.0]
  belongs_to :user
  def change
    create_table :items do |t|

      t.string     :item_name                  null:false
      t.text       :item_info                  null:false
      t.integer    :category_id                null:false
      t.integer    :item_sales_status_id       null:false
      t.integer    :delivery_charge_id         null:false
      t.integer    :prefecture_id              null:false
      t.integer    :shipping_days_id           null:false
      t.integer    :price                      null:false
      t.references :user                       null: false, foreign_key: true

      t.timestamps

    end
  end
end
