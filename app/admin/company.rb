ActiveAdmin.register Company do

  menu :priority => 2
  permit_params :id, :initiation_date, :company_name, :company_location, :contact_person_name,
                :phone, :last_contacted_date, :details, :future_action, :initiator, :email, :management_area,
                :company_sector, :contact_again_later, :admin_user_id

  # ========================= Remove batch actions =============================
  config.batch_actions = false

  # ========================= Define Table Parameters =============================
  index :title => "IIM Indore CRM Tool v1.0" do

    selectable_column

    column :company_name do |c|
      link_to c.company_name, admin_company_path(c)
    end

    # column "Company", :company_name
    column "Location", :company_location
    column "Name",:contact_person_name
    column "Email ID", :email
    column "Sector", :company_sector
    column "Mgmt Area", :management_area
    column "Initiated On", :initiation_date
    column "Last Updated At", :updated_at

    column "Last Contact Status", :last_contacted_date do |a|
      if a.contact_again_later
        z=(Time.now - a.last_contacted_date)/3600/24
        status_tag(( z < 7 ? "Contacted on #{a.last_contacted_date.to_date}" : "Contact Immediately : Last  #{a.last_contacted_date.to_date}" ),
                   (z < 7 ? :ok : :error ))
      else
        # a.last_contacted_date.to_date
      end
    end
    column "Contact Again", :contact_again_later

    actions :defaults => false do |foobar| # For actions to be displayed
      # link_to 'View', admin_company_path(foobar)
      link_to 'Edit', edit_admin_company_path(foobar)
      # link_to 'Delete', admin_company_path(foobar), :method => :delete, :confirm => "Are you sure"
    end
    # actions
  end

  # ========================= Define Form Actions & Parameters =============================
  form do |f|
    f.inputs "Company Details" do
      f.inputs :initiation_date #, :as => :date_picker
      # f.inputs :initiation_date, :as => :string, :input_html => {:class => "hasDatetimepicker"}
      f.inputs :company_name
      f.inputs :company_location
      f.inputs :company_sector
      # f.inputs :management_area, :label => "Management Area", :as => :select, :collection => ["Strategy","Operations", "Marketing", "HR", "Finance"]
      f.inputs :management_area #, :label => "Management Area", :as => :select, :collection => AdminUser.all.map{|m| m.email}
      f.inputs :contact_person_name
      f.inputs :phone
      f.inputs :email
      f.inputs :last_contacted_date
      f.inputs :details
      f.inputs :future_action
      f.inputs :contact_again_later
      f.inputs :initiator

    end
    f.actions
  end


end
