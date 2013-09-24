class ChangeCompoBracketToText < ActiveRecord::Migration
  def up
	change_column :compos, :bracket, :text
  end

  def down
	change_column :compos, :bracket, :string
  end
end
