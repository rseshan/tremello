class Musician < ActiveRecord::Base
	has_secure_password

  attr_accessible :bio, :email, :name, :bands_attributes, :password, :password_confirmation

  has_many :memberships
  has_many :bands, :through => :memberships 

  accepts_nested_attributes_for :bands

  validates_uniqueness_of :email
  

end
