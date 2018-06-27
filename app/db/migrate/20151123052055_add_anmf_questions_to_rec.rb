class AddAnmfQuestionsToRec < ActiveRecord::Migration
  def change
    add_column :recs, :professional_development, :boolean, default: true
    add_column :recs, :induction, :boolean, default: true
  end
end
