class CreateFirstUser < ActiveRecord::Migration
  def self.up
    person = Person.create!( :email => 'admin@nuw.org.au', :password => 'temptemp', :password_confirmation => 'temptemp' )
  end

  def self.down
    person = Person.find_by_email( 'admin@nuw.org.au' )
    person.destroy
  end
end
