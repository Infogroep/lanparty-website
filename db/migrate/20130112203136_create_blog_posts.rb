class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.references :user

      t.timestamps
    end
    add_index :blog_posts, :user_id
  end
end
