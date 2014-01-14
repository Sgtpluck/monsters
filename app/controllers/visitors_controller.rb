class VisitorsController < ApplicationController
  
  def analytics
    current_visitor
    @visitors = Visitor.all
  end


end
