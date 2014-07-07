class AddColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :initiator, :string
    add_column :companies, :admin_user_id, :integer
    add_column :companies, :email, :string
    add_column :companies, :company_sector, :string
    add_column :companies, :management_area, :string
  end
end
