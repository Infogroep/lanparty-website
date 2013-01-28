class RenameAccessTypes < ActiveRecord::Migration
	def change
		change_table :user_groups do |t|
			t.rename :store_editing, :access_type_store_editing
			t.rename :user_editing, :access_type_user_editing
			t.rename :blog_editing, :access_type_blog_editing
			t.rename :compo_editing, :access_type_compo_editing
			t.rename :user_detail_viewing, :access_type_user_detail_viewing
		end
	end
end
