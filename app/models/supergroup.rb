class Supergroup < ActiveRecord::Base
	# Used for index searching
  include Filterable
  scope :name_like, -> (name) {joins(:translations).where("supergroup_translations.name ilike ? and supergroup_translations.locale = ?", "%#{name}%", I18n.locale)}
  mount_uploader :banner, BannerUploader
  mount_uploader :logo, LogoUploader
	mount_uploader :union_rep, ProfileUploader
	mount_uploader :facebook_image, AttachmentUploader

  has_many :posts, as: :parent
  validates :name, :short_name, :www, :call_to_action, :action1, :background_colour, :font_colour, :explanation, presence: true
  validates_uniqueness_of :short_name
  translates :name, :call_to_action, :action1, :explanation, :submissions_heading, :union_rep_cite, :union_rep_quote, :fallbacks_for_empty_translations => true
  
  def set_defaults_from_owner
		owner = Union.find(Rails.application.config.owner_union.id)
		self.call_to_action ||= owner.call_to_action
		self.explanation ||= owner.explanation
		self.action1 ||= owner.action1
		self.submissions_heading ||= owner.submissions_heading
		self.background_colour ||= owner.background_colour
		self.font_colour ||= owner.font_colour
	end
end
