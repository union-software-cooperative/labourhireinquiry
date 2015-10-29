class ChangeDefaultForVolunteerOnPeople < ActiveRecord::Migration
  def up
    change_column_default :people, :volunteer, false
    Person.update_all(volunteer: false)
  end

  def down
    change_column_default :people, :volunteer, true
  end
end
