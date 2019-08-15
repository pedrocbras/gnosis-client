class AddTrackableColumnsToUniversity < ActiveRecord::Migration[5.2]
  def change
      add_column :universities, :sign_in_count, :integer, :default => 0
      add_column :universities, :current_sign_in_at, :datetime
      add_column :universities,:last_sign_in_at, :datetime
      add_column :universities,:current_sign_in_ip, :string
      add_column :universities,:last_sign_in_ip, :string
  end
end
