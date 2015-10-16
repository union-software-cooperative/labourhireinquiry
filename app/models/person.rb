class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :attachment, ProfileUploader
  
  include Filterable
  scope :name_like, -> (name) {where("first_name ilike ? or last_name ilike ? or email ilike ?", "%#{name}%", "%#{name}%", "%#{name}%")}

  def name
  	"#{first_name} #{last_name}"
  end

  def display_name
  	"#{first_name} #{last_name}"
  end
end
