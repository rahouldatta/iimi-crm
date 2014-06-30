class AddColumnsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :committee, :string, :default => "PlaceCom"
  end
end
