class CreateDrones < ActiveRecord::Migration
  def change
    create_table :drones do |t|
      t.string :dronename
      t.string :email
      t.timestamps
    end
  end
end
