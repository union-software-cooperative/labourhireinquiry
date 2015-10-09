class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
  	email
  end
end
