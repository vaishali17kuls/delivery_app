class AddDroneIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :drone_id, :integer
  end
end
