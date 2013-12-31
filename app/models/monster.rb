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
  scope :by_env, lambda {|env| where("(environment) LIKE ?", "%#{env}%")}

  def self.find_monsters(cr=nil,environment=nil,name=nil)
    if cr && environment
      where(cr: cr).by_env(environment)
    elsif cr 
      where(cr: cr)
    elsif environment
      by_env(environment)
    elsif name
      name = name.titleize
      where("name LIKE ?", "%#{name}%")
    else
      all
    end
  end

 # where("(monsters.environment) LIKE :s", :s "%#{environment}%")
  # .where("(environment LIKE ?)", "%#{environment}")

end
