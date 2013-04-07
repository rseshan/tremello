class AddDigestToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :password_digest, :string
  end
end
