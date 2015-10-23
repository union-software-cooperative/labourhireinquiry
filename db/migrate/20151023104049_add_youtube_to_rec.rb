class AddYoutubeToRec < ActiveRecord::Migration
  def change
    add_column :recs, :youtube, :string
  end
end
