ActiveAdmin.register Company do

  permit_params :id, :initiation_date, :company_name, :company_location, :contact_person_name, :phone, :last_contacted_date, :details, :future_action, :initiator, :email

  index :title => "IIM Indore CRM Tool v1.0" do
    selectable_column
    id_column
    column "Company", :company_name
    column "Location", :company_location
    column "Name",:contact_person_name
    column "Email ID", :email
    column "Future Actions", :future_action
    column "Initiated At", :created_at
    column "Last Contact Status", :last_contacted_date do |a|
      z=(Time.now - a.last_contacted_date)/3600/24
      status_tag(( z > 7 ? "Contacted on #{a.last_contacted_date.to_date}" : "Contact Immediately : Last  #{a.last_contacted_date.to_date}" ),
                 (z > 7 ? :ok : :warning ))
    end
    actions
  end

  filter :last_contacted_date

end
