class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :email
      t.string :bio

      t.timestamps
    end
  end
end
