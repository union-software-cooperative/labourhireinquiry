class AddEnabledToSupergroup < ActiveRecord::Migration
  def change
    add_column :supergroups, :enabled, :boolean, default: false
  end
end
