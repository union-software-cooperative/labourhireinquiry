class AddSupermarketSupplyToRec < ActiveRecord::Migration
  def change
    add_column :recs, :supermarket_supply, :string
    add_column :recs, :string, :string
  end
end
