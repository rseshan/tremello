class CreateInvitationsTableStatus < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :status
      t.integer :inviter_id
      t.integer :invitee_id
      t.integer :band_id
      t.timestamps
    end
  end
end
