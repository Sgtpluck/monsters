class Monster < ActiveRecord::Base
  self.inheritance_column = nil # this is allowing me to have a column named "type"
  validates :name, presence: true
  validates :type, presence: true
  validates :cr, presence: true
  validates :cr, numericality: { greater_than: -1 }
  validates :environment, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader

  def self.find_monsters(cr=nil,environment=nil)
    if cr && environment
      where(cr: cr).where(environment: environment)
    elsif cr 
      where(cr: cr)
    elsif environment
      where(environment: environment)
    else
      all
    end
  end


end
