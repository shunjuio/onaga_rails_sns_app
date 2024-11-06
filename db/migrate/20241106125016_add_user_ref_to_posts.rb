class AddUserRefToPosts < ActiveRecord::Migration[7.2]
  def change
    remove_column :posts, :user_id, :integer
    add_reference :posts, :user, null: false, foreign_key: true, after: :id
  end
end
