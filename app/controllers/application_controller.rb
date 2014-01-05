class ApplicationController < ActionController::Base
  before_action :current_nerd
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_nerd
    @current_nerd  = nil
    session[:nerd_id] = nil
    # ||= Nerd.find(session[:nerd_id]) if session[:nerd_id]
  end

  helper_method :current_nerd
end