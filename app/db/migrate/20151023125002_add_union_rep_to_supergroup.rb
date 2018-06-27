class AddUnionRepToSupergroup < ActiveRecord::Migration
  def change
    add_column :supergroups, :union_rep_quote, :text
    add_column :supergroups, :union_rep, :string
    add_column :supergroups, :union_rep_cite, :string
  end
end
