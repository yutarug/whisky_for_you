class AddColumnsToBottles < ActiveRecord::Migration[5.2]
  def change
    add_column :bottles, :alcohol_content, :integer
  end
end
