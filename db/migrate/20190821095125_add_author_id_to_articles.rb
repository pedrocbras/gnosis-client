class AddAuthorIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :author_id, :integer
    remove_column :articles, :user_id
  end
end
