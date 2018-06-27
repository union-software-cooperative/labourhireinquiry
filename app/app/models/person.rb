class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :union
  has_many :recs,:dependent => :delete_all
  has_many :posts,:dependent => :delete_all
  has_many :comments,:dependent => :delete_all

  before_validation :set_default_password, on: [:create]
  validates :union, :first_name, presence: true

  mount_uploader :attachment, ProfileUploader
  
  acts_as_follower
  
  include Filterable
  scope :name_like, -> (name) {where("first_name ilike ? or last_name ilike ? or email ilike ?", "%#{name}%", "%#{name}%", "%#{name}%")}
  scope :invited, -> {where("not invited_by_id is null")}
  scope :not_invited, -> {where("invited_by_id is null")}

  def name
  	"#{first_name} #{last_name}"
  end

  def display_name
  	"#{first_name} #{last_name}"
  end

  def set_default_password
    self.password ||= SecureRandom.uuid
    self.password_confirmation ||= self.password
  end
end
