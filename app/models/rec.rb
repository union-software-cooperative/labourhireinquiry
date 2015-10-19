class Rec < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	
	belongs_to :company
	belongs_to :union
	belongs_to :person
	has_many :posts, :as => :parent
	
	validates :name, :company, :union, :person, :end_date, presence: true

	after_initialize :set_defaults

	serialize :nature_of_operation, Array

	acts_as_followable

	def post_title
		"Post your question or industrial action pics here"
	end

	def self.questions 
		[
			:formally_employed,
			:paid_fairly,
			:compliant_employment,
			:could_speak_up,
			:secure_stay,
			:safe_work,
			:predictable_hours,
			:family_life,
			:primary_carer,
			:entitlements,
			:financially_stable,
			:accommodation_secure,
			:community_life,
			:prefer_flexibility
		]
	end

	def set_defaults
		Rec.questions.each do |q|
			write_attribute q, true
		end
	end
end
