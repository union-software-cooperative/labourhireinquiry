class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_person!
  before_action :set_union

  include ApplicationHelper

  def set_union
  	@union = Union.find(params[:union_id] || owner_union.id)
  end
end
