class Location < ActiveRecord::Base
  attr_accessible :address, :city, :country, :latitude, :longitude, :state
end
