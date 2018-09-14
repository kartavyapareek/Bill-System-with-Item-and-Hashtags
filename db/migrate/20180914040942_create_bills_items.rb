class CreateBillsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bills_items do |t|
      t.references :item, foreign_key: true
      t.references :bill, foreign_key: true
      t.integer :quantity
    end
  end
end
