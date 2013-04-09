class Invitation < ActiveRecord::Base
  attr_accessible :status, :inviter_id, :invitee_id, :band_id

  STATUS = {
    :sent => 0,
    :accepted => 1,
    :declined => 2
  }

  def accept
    self.status = STATUS[:accepted]
  end

  def decline
    self.status = STATUS[:declined]
  end

end