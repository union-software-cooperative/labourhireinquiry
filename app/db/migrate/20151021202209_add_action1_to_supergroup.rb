class AddAction1ToSupergroup < ActiveRecord::Migration
  def change
    add_column :supergroups, :action1, :string
  end
end
