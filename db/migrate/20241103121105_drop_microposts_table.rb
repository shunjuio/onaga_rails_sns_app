class DropMicropostsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :microposts, if_exists: true
  end

  def down
    # 必要に応じてテーブル再作成のコードを記述
    create_table :microposts do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
