class AddVolunteerToPeople < ActiveRecord::Migration
  def change
    add_column :people, :volunteer, :boolean, default: true
  end
end
