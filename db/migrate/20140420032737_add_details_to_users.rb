class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position_id, :integer
    add_column :users, :team_id, :integer
    add_column :users, :skill, :integer
  end
end
