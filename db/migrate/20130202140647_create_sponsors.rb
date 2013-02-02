class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :website
      t.string :image

      t.timestamps
    end
  end
end
