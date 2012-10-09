class CreateCompos < ActiveRecord::Migration
  def change
    create_table :compos do |t|
      t.string :info
      t.integer :slots
      t.date :date
      t.integer :group_size
      t.integer :game_id

      t.timestamps
    end
  end
end
