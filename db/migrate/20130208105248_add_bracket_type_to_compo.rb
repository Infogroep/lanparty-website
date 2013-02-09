class AddBracketTypeToCompo < ActiveRecord::Migration
  def change
    add_column :compos, :bbracket_type, :integer, :default => 1
  end
end
