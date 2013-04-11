 class Invitation < ActiveRecord::Base
  attr_accessible :status, :inviter_id, :invitee_id, :band_id

  STATUS = {
    :sent => 0,
    :accepted => 1,
    :declined => 2
  }

  def accept
    self.status = STATUS[:accepted]
    self.save
    member_accepted = Membership.where(:band_id => self.band.id, :musician_id => self.invitee.id).first_or_create
  end

  def inviter
    Musician.find_by_id(self.inviter_id)
  end

  def invitee
    Musician.find_by_id(self.invitee_id)
  end

  def band
    Band.find_by_id(self.band_id)
  end

end