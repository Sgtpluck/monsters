class Monster < ActiveRecord::Base
  self.inheritance_column = nil # this is allowing me to have a column named "type"
  validates :name, presence: true
  validates :type, presence: true
  validates :cr, presence: true
  validates :cr, numericality: { greater_than: 0 }
  validates :environment, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end
