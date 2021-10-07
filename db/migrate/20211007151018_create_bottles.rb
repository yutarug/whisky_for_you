class CreateBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :bottles do |t|
      t.integer :area_id, null: false
      t.string :name, null: false
      t.integer :age
      t.string :feature
      t.string :image_id
      t.text :introduction
      t.timestamps
    end
  end
end
