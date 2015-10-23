class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_person!
  before_action :set_union

  include ApplicationHelper

  def set_union
    id = params[:union_id] || (params[:controller]=="supergroups" ? params[:id] : nil) 
    id ||= owner_union.id
    
    if (Integer(id) rescue nil)
      @union = Supergroup.find(id)
    else
      @union = Supergroup.where("short_name ilike ?",id.downcase).first
    end
  end

  def after_sign_in_path_for(current_person)
    union_path(current_person.union)
    #unless request.referrer.include?(new_person_session_url)
    #  request.referrer || root_path
    #else
    #  root_path
    #end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
