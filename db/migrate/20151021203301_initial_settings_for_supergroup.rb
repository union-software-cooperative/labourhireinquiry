class InitialSettingsForSupergroup < ActiveRecord::Migration
  def self.up
    Supergroup.where(type: "Union").update_all({
    		call_to_action: "LET'S BRING BACK SECURE JOBS", 
    		explanation: "The Victorian government says they are determined to regulate labour hire and irradicate sham contracting.  They say they want an end to the exploitation of a growing number people in insecure jobs.  More than 40% of Australians have insecure jobs.  That's un-Australian.   Have your say and make them fix it!",
    		submissions_heading: "Join the chorus of submissions before they close on the 27 November 2015",
    		action1: "Exploited? Tell your story to the inquiry",
    		background_colour: "#900",
    		font_colour: "white"
    	})
  end

  def self.down
  end
end
