class CreateOrderFroms < ActiveRecord::Migration[6.0]
  def change
    create_table :order_froms do |t|
      t.string     :postal_code,       null: false
      t.integer    :shipping_area_id,  null: false
      t.string     :city_name,         null: false
      t.string     :block_name,        ull: false
      t.string     :buliding_name     
      t.string     :phone_number,      null: false
      t.references :order,             null: false, foreign_key: true 
      t.timestamps
    end
  end
end
