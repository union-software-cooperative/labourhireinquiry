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
				:discuss_safety
			#	:hsr_explained
			],
			personal_impact: [
				:predictable_hours,
				:primary_carer,
				:entitlements
			#	:community_life
			], 
			financial_security: [
				:financially_stable,
				:accommodation_secure,
				:feeling_secure
			]
			#feeling_trapped: [
			#	:options
			#]

			#:formally_employed
			#:family_life
			#:secure_stay,
			#:family_life,
			#:prefer_flexibility
		}
	end

	def display_name
		result = ""
		if self.is_anonymous
			result = "Anonymous"
		else 
			result = self.person.display_name
		end
		result += ", #{self.location}" unless self.location.blank?
		result
	end

	def self.token
		# generate a vaguely readable/memorable token of alternating vowel and consonants
		v = %w[a e i o u]
		c = ('a'..'z').to_a
		c = c - v - ['x', 'q'] # I don't like the ones with x and q
		s = ""

		# 7 alternate vowels and consonants gives me 16M, the root of which is 4000, which is the number of submission before I've got even odds of colliding
		(1..7).each do |i|
			s << c[SecureRandom.random_number(c.count)] if i % 2 == 1
			s << v[SecureRandom.random_number(v.count)] if i % 2 == 0 
		end
		s = Rec.token if Rec.find_by_token(s) # recursively find another token, if this one is used
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
