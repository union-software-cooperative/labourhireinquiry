class People::InvitationsController < Devise::InvitationsController
   private


  def after_accept_path_for(current_person)
    edit_person_path current_person
  end

  def invite_resource
    ## skip sending emails on invite
    resource_class.invite!(invite_params, current_inviter) do |u|
      #u.skip_invitation = true
    end
  end

  def invite_params
   	params.permit(person: [:email,:invitation_token, :union_id, :first_name, :last_name,  :title, :address, :mobile, :fax
])[:person]
   end
end