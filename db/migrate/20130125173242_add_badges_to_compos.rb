class AddBadgesToCompos < ActiveRecord::Migration
  def change
    add_column :compos, :participation_badge, :string
    add_column :compos, :winning_badge, :string
  end
end
