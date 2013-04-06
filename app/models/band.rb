class Band < ActiveRecord::Base
  attr_accessible :name, :bio, :musicians_attributes

  has_many :memberships
  has_many :musicians, :through => :memberships 

  accepts_nested_attributes_for :musicians

end
