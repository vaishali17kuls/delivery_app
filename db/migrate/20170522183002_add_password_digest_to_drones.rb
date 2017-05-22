class AddPasswordDigestToDrones < ActiveRecord::Migration
  def change
    add_column :drones, :password_digest, :string
  end
end
