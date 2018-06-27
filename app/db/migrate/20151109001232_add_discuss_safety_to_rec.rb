class AddDiscussSafetyToRec < ActiveRecord::Migration
  def change
    add_column :recs, :discuss_safety, :boolean
  end
end
