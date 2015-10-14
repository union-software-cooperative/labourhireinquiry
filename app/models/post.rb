class Post < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
  belongs_to :person
  belongs_to :parent, polymorphic: true
end
