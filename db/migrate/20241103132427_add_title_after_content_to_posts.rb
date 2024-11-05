class AddTitleAfterContentToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :title, :string, after: :content
  end
end

