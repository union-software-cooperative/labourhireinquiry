class ProfileUploader < AttachmentUploader
	 # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  def filename
    if original_filename.present?
      "#{secure_token}.#{file.extension}"
    end
  end
  
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process resize_to_limit: [400, 10000]
  process quality: 100

  def quality(asdf)
  	#DO NOTHING FOR PROFILE PICS
  end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_and_crop: [40]
  end

  version :quote do 
    process resize_and_crop: [150]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end


  # Resize and crop square from Center
  # http://blog.aclarke.eu/crop-and-resize-an-image-using-minimagick/
  def resize_and_crop(size)  
    manipulate! do |image|                 
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width])/2).round 
        image.shave("0x#{remove}") 
      elsif image[:width] > image[:height] 
        remove = ((image[:width] - image[:height])/2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
  end
end

