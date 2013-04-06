class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :band_id
      t.integer :musician_id
      t.timestamps
    end
  end
end
