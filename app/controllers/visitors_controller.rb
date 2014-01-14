class VisitorsController < ApplicationController
  
  def analytics
    @visitors = Visitor.all
  end


end
