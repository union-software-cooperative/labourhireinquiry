# TODO YOU CAN TELL I DON'T KNOW WHAT I'M DOING HERE!!
#module YourApp
#  class Application < Rails::Application
    Rails.application.config.after_initialize do
    	Rails.application.config.owner_union = Union.find_by_short_name(ENV['OWNER_UNION'])
    	if Rails.application.config.owner_union.nil?
    		Rails.application.config.owner_union = Union.create(name: ENV['OWNER_UNION'], short_name: ENV['OWNER_UNION'])
    	end
    end
#  end
#end
