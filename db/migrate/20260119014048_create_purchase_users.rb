class CreatePurchaseUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_users do |t|
      t.references :furima, null:false, foreign_key:true
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
