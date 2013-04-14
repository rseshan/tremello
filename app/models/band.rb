class Band < ActiveRecord::Base
  attr_accessible :name, :bio, :musicians_attributes, :location_id

  has_many :memberships
  has_many :musicians, :through => :memberships 

  belongs_to :location 

  accepts_nested_attributes_for :musicians

end
