class Rec < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	belongs_to :company
	belongs_to :union
	belongs_to :person
	validates :name, :company, :union, :person, :end_date, presence: true
end
