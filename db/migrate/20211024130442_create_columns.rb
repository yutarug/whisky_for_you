class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :title
      t.text :introduction
      t.string :image_id
      t.timestamps
    end
  end
end
