class Location < ActiveRecord::Base
  attr_accessible :address, :city, :country, :latitude, :longitude, :state
  has_many :musicians
  has_many :bands
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?

  def full_address
    @full_address = address + ", " + city + ", " + state + ", " + country
  end

end
