class AddSummaryToRecs < ActiveRecord::Migration
  def change
    add_column :recs, :summary, :string
  end
end
