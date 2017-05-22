class DropProductsTable < ActiveRecord::Migration
  def up
    drop_table :drones
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
