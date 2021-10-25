class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
    t.references :bottle, foreign_key: true
    t.references :recommendation, foreign_key: { to_table: :bottles }

    t.timestamps
    end
  end
end
