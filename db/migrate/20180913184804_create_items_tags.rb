class CreateItemsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :items_tags do |t|
      t.references :item, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
