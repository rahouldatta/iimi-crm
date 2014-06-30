class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.datetime :initiation_date
      t.string :company_name
      t.string :company_location
      t.string :contact_person_name
      t.string :phone
      t.datetime :last_contacted_date
      t.text :details
      t.text :future_action
      t.boolean :contact_again_later

      t.timestamps
    end
  end
end
