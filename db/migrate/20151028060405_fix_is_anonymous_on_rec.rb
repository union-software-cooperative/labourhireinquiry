class FixIsAnonymousOnRec < ActiveRecord::Migration
  def change
  	remove_column :recs, :is_anonymous, :text
    add_column :recs, :is_anonymous, :boolean, default: false
  end
end
