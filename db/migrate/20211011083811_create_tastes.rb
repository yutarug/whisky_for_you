class CreateTastes < ActiveRecord::Migration[5.2]
  def change
    create_table :tastes do |t|
      t.integer :bottle_id
      t.integer :peaty
      t.integer :fruity
      t.integer :floral
      t.integer :feinty
      t.integer :sulphury
      t.integer :woody
      t.integer :winey
      t.integer :cereal

      t.timestamps
    end
  end
end
