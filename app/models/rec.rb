class Rec < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	
	belongs_to :company
	belongs_to :union
	belongs_to :person
	has_many :posts, :as => :parent
	accepts_nested_attributes_for :person

	#validates :union,  presence: true

	after_initialize :set_switch_defaults

	serialize :nature_of_operation, Array

	acts_as_followable

	before_validation :set_token, on: [:create]

	def post_title
		"Post questions and supplementary information here"
	end

	def self.questions 
		{
			pay_and_conditions: [
				:paid_fairly,
				:compliant_employment,
				:could_speak_up
			],
			health_and_safety: [
				:safe_work, 
				:safe_work_explained,
				:hsr_explained
			],
			personal_impact: [
				:predictable_hours,
				:primary_carer,
				:entitlements,
				:community_life
			], 
			financial_security: [
				:financially_stable,
				:accommodation_secure,
				:feeling_secure
			],
			feeling_trapped: [
				:options
			]
			#:formally_employed
			#:family_life
			#:secure_stay,
			#:family_life,
			#:prefer_flexibility
		}
	end

	def self.token
		# generate a vague readable/memorable token
		v = %w[a e i o u]
		c = ('a'..'z').to_a
		c = c - v
		s = ""

		(1..7).each do |i|
			s << c[SecureRandom.random_number(21)] if i % 2 == 1
			s << v[SecureRandom.random_number(5)] if i % 2 == 0 
		end
		s
	end

	def set_token
		self.token ||= Rec.token
	end

	def set_switch_defaults
		Rec.questions.each do |k,v|
			v.each do |q|
				write_attribute q, true if self[q].nil?
			end
		end
	end
end
