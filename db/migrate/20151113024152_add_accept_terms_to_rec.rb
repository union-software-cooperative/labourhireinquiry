class AddAcceptTermsToRec < ActiveRecord::Migration
  def change
    add_column :recs, :accept_terms, :boolean, default: true
  end
end
