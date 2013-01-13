class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.text :content
      t.references :blog_post
      t.references :user

      t.timestamps
    end
    add_index :blog_comments, :blog_post_id
    add_index :blog_comments, :user_id
  end
end
