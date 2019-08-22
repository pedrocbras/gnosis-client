class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscriber, :boolean
  end
end
