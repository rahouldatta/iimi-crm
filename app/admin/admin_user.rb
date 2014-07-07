ActiveAdmin.register AdminUser do

  menu :priority => 3
  permit_params :email, :password, :password_confirmation, :name

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
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      #
      # if(f.object == current_admin_user)
      #   f.input :password
      #   f.input :password_confirmation
      # end
      f.input :committee
    end
    f.actions
  end


end
