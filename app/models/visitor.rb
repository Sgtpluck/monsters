class Visitor < ActiveRecord::Base

  def add_visit
    self.update(visits: (visits+1))
  end
  
end