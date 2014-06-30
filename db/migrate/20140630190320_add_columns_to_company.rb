class AddColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :initiator, :string
  end
end
