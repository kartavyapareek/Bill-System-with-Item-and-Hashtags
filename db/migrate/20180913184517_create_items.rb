class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
