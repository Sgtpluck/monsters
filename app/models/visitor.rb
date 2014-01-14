class Visitor < ActiveRecord::Base

  def add_visit
    self.update(visits: (visits+1))
  end

  def self.ips
    @ips = []
    all.each do |visitor|
      @ips << visitor.ip
    end
  end


  def self.unique
    ips
    @ips.uniq.length
  end
  
end