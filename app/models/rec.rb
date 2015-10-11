class Rec < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	belongs_to :company
	belongs_to :union
	belongs_to :person
end
