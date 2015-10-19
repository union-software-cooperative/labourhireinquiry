class AddWhenToRecs < ActiveRecord::Migration
  def change
    add_column :recs, :when, :string
  end
end
