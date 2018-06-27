class AddEntitlementsToRec < ActiveRecord::Migration
  def change
    add_column :recs, :entitlements, :boolean
    add_column :recs, :entitlements_comment, :text
  end
end
