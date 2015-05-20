class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :components, null: false, array: true
      t.integer :category_id, null: false
      t.integer :available_count, null: true, default: 0
      t.timestamps null: false
    end
  end
end
