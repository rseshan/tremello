class Membership < ActiveRecord::Base
  belongs_to :musician
  belongs_to :band

  attr_accessible :musician_id, :band_id
end
