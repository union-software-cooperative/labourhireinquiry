class Supergroup < ActiveRecord::Base
	# Used for index searching
  include Filterable
  scope :name_like, -> (name) {where("name ilike ?", "%#{name}%")}
  mount_uploader :banner, BannerUploader
  mount_uploader :logo, LogoUploader

  has_many :posts, as: :parent
  validates :name, :short_name, presence: true
  validates_uniqueness_of :short_name
  
  acts_as_followable
end
