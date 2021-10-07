class CreateTagmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tagmaps do |t|
      t.string :bottle_id, null: false
      t.string :tag_id, null: false

      t.timestamps
    end
  end
end
