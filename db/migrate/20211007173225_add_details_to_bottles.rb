class AddDetailsToBottles < ActiveRecord::Migration[5.2]
  def change
    add_column :bottles, :classification, :integer
    add_column :bottles, :distillery_name, :string
  end
end
