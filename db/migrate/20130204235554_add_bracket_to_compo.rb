class AddBracketToCompo < ActiveRecord::Migration
  def change
    add_column :compos, :bracket, :string
  end
end
