class AddConfigurationToSupergroup < ActiveRecord::Migration
  def change
    add_column :supergroups, :call_to_action, :string
    add_column :supergroups, :explanation, :text
    add_column :supergroups, :submissions_heading, :string
    add_column :supergroups, :background_colour, :string
    add_column :supergroups, :font_colour, :string
  end
end
