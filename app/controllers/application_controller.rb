# Application controller, sets the current_nerd session.
class ApplicationController < ActionController::Base
  before_action :current_nerd
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_nerd
    @current_nerd ||= Nerd.find(session[:nerd_id]) if session[:nerd_id]
  end
  helper_method :current_nerd

  def current_visitor
    @current_visitor ||= if session[:visitor_id] 
      Visitor.find( session[:visitor_id] )
    else
      visitor = Visitor.create(ip: request.remote_ip, mobile: user_mobile?)
      session[:visitor_id] = visitor.id
      visitor
    end
    @current_visitor.add_visit
  end

  def user_mobile?
    request.user_agent.downcase.include?('mobile')
  end
  helper_method :user_mobile?

end
