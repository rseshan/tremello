class Musician < ActiveRecord::Base
	has_secure_password
  validates :password, :presence => { :on => :create }

  attr_accessible :bio, :email, :name, :bands_attributes, :password, :password_confirmation, :location_id

  has_many :memberships
  has_many :bands, :through => :memberships

  belongs_to :location 

  accepts_nested_attributes_for :bands

  validates_uniqueness_of :email
  
end
