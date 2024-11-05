# db/migrate/xxxxxx_remove_title_from_posts.rb
class RemoveTitleFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :title, :string
  end
end
