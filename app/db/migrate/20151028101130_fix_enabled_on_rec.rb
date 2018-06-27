class FixEnabledOnRec < ActiveRecord::Migration
  def change
  	remove_column :recs, :enabled, :boolean
    add_column :recs, :enabled, :boolean, default: true
    
  end
end
