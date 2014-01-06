class Nerd < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, on: :create
  validates :email, confirmation: true, format: { with: /.+@(\w+\.)+\w+/, message: 'Must enter a valid email address.' }
  validates :password_digest, presence: true 

end
