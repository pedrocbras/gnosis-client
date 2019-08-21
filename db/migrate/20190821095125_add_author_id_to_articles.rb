class AddAuthorIdToArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :author
    add_column :articles, :author_id, :integer
  end
end
