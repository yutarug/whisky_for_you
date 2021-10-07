class AddDetailsToBottles < ActiveRecord::Migration[5.2]
  def change
    add_column :bottles, :classification, :integer
  end
end
