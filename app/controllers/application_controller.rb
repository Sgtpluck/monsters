# Application controller, sets the current_nerd session.
class ApplicationController < ActionController::Base
  before_action :current_nerd
  before_action :current_visitor
  # before_action :add_visit, except: [:analytics]
  # before_action :update_pageview_count, except: [:analytics]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_nerd
    @current_nerd ||= Nerd.find(session[:nerd_id]) if session[:nerd_id]
  end
  helper_method :current_nerd

  def current_visitor
    session[:visitor_id] = nil
    # if session[:visitor_id]
    #   @current_visitor = Visitor.find(session[:visitor_id])
    # elsif cookies.permanent[:visitor_id] && Visitor.find_by(cookie_id: cookies.permanent[:visitor_id])
    #   @current_visitor = Visitor.find_by(cookie_id: cookies.permanent[:visitor_id])
    #   session[:visitor_id] = @current_visitor.id
    # else
    #   # Assign random number as cookie id
    #   cookies.permanent[:visitor_id] = rand(1000000000000000000).to_s
    #   @current_visitor = Visitor.create(cookie_id: cookies.permanent[:visitor_id], mobile: user_mobile?, ip: request.remote_ip)
    #   session[:visitor_id] = @current_visitor.id
    # end
    # @current_visitor
  end
  helper_method :current_visitor
  
  def add_visit
    # Checking whether the referral is coming from elsewhere in the same site, which in this case has a URL including 'slothbook'
    unless ( request.referer && request.referer.include?("monstersmash") )
      @current_visitor.update(visits: @current_visitor.visits + 1)
    end
  end

  def update_pageview_count
    @current_visitor.update(pageview: @current_visitor.pageview + 1)
  end

  # def current_visitor
  #   @current_visitor ||= if session[:visitor_id] 
  #     Visitor.find( session[:visitor_id] )
  #   else
  #     reset_session
  #     visitor = Visitor.create(ip: request.remote_ip, mobile: user_mobile?)
  #     session[:visitor_id] = visitor.id
  #     visitor
  #   end
  # end

  def user_mobile?
    request.user_agent.downcase.include?('mobile')
  end
  helper_method :user_mobile?

end


