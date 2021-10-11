class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.integer :bottle_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
