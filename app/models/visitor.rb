class Visitor < ActiveRecord::Base

    def self.total_pageviews
    self.sum { |visitor| visitor.pageview }
  end

  def self.total_visits
    self.sum { |visitor| visitor.visits }
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