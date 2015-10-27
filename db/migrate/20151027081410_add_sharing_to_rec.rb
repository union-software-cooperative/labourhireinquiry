class AddSharingToRec < ActiveRecord::Migration
  def change
    add_column :recs, :enabled, :boolean
    add_column :recs, :facebooked, :boolean
    add_column :recs, :tweeted, :boolean
    add_column :recs, :token, :string
    add_column :recs, :volunteer, :boolean
    add_column :recs, :volunteer_comment, :string
  end
end
