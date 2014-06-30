ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index :title => "IIM Indore CRM Tool v1.0" do
    # selectable_column
    id_column
    column "Email ID", :email
    column :committee
    column "Last Login", :current_sign_in_at
    column "Joined On", :created_at
    actions
  end

  filter :email
  filter :committee
  filter :current_sign_in_at
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :committee
    end
    f.actions
  end

end
