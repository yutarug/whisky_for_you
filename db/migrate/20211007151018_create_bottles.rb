class CreateBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :bottles do |t|
      t.integer :area_id, null: false
      t.string :bottle_name, null: false
      t.integer :age
      t.string :feature
      t.string :image_id
      t.text :introduction
      t.string :japanese_bottle_name
      t.integer :price_level,default: 0, null: false, limit: 2
      t.timestamps
    end
  end
end
