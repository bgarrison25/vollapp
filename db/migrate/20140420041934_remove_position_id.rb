class RemovePositionId < ActiveRecord::Migration
  def change
    remove_column :users, :position_id, :integer
  end
end
