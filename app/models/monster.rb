class Monster < ActiveRecord::Base
  self.inheritance_column = nil # this is allowing me to have a column named "type"
  validates :name, presence: true
  validates :type, presence: true
  validates :cr, presence: true
  validates :cr, numericality: { greater_than: 0 }
  validates :environment, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  validates :exp, presence: true
  validates :exp, numericality: { greater_than: 49}

  def self.find_monsters(cr=nil,enviro=nil,search_name=nil)
    if cr && enviro
      enviro = enviro.map {|env| "%" + env + "%" }
      where(cr: cr).where{environment.like_all enviro}
    elsif cr 
      where(cr: cr)
    elsif enviro
      enviro = enviro.map {|env| "%" + env + "%" }
      where{environment.like_all enviro}
      # The more complicated, non-squeel version:
      # where((["LOWER(environment) LIKE ?"] * enviro.size).join(" AND "), *enviro.map{|k| "%#{k.downcase}%"})
    elsif search_name
      search_name = "%" + search_name.titleize + "%"
      where{name =~ search_name}
    else
      all
    end
  end

end
