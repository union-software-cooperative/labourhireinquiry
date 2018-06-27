class AddCompanyNameToRec < ActiveRecord::Migration
  def change
    add_column :recs, :company_name, :string
  end
end
