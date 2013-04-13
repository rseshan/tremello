class AddLocationIdsToArtists < ActiveRecord::Migration
  def change
    add_column :musicians, :location_id, :integer
    add_column :bands, :location_id, :integer
  end
end
