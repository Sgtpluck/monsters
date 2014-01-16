class VisitorsController < ApplicationController
  
  def analytics
    @visitors = Visitor.all
    @body_class = 'visit'
  end


end
