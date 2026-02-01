class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      #t.integer :price  ,null: false
      t.string :postal_code, null:false
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :addresses, null:false
      t.string :building
      t.string :phone_number, null:false
      t.references :purchase_user, null:false, foreign_key:true
      #t.references :furima, null:false, foreign_key:true
      t.timestamps
    end
  end
end
