class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :amount
      t.references :product, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
