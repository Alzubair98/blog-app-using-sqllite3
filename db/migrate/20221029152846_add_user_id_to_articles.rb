class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :user_id, :int
  end
end
