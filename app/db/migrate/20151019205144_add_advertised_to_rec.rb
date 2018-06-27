class AddAdvertisedToRec < ActiveRecord::Migration
  def change
    add_column :recs, :advertised, :string
  end
end
