class CreateShippings < ActiveRecord::Migration[5.1]
  def change
    create_table :shippings do |t|
      t.string :address
      t.string :status
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
