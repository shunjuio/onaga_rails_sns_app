class AddUserIdToComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :user_id if column_exists?(:comments, :user_id)
    add_column :comments, :user_id, :integer, after: :id
    add_index :comments, :user_id
  end
end
