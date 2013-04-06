class Musician < ActiveRecord::Base
  attr_accessible :bio, :email, :name, :bands_attributes

  has_many :memberships
  has_many :bands, :through => :memberships 

  accepts_nested_attributes_for :bands

end
