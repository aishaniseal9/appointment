ActiveAdmin.register HospitalTest do
  actions :all, except: [:update,:new,:edit, :destroy]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :hospital_id, :test_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:hospital_id, :test_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :all, except: [:edit, :update]
  #form :partial => "form"
 
   # See permitted parameters documentation:
   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
   #
   # Uncomment all parameters which should be permitted for assignment
   #
    permit_params :hospital_id, :test_id
   index do
   selectable_column
   column :id ,:sortable do |hospital_test|
     link_to hospital_test.id,admin_hospital_test_path(hospital_test)
   end
   column "Tests" do |hospital_test|
     link_to hospital_test.test.name,admin_test_path(hospital_test.test)
   end
   column "Hospitals" do |hospital|
     link_to hospital.hospital.Hname,admin_hospital_path(hospital.hospital)
   end
  
  
   column :created_at
   column :updated_at
   actions defaults: true 
   end
   show :title => "HospitalTestAssociation" do
     attributes_table do
      
       row :test_id do
         link_to hospital_test.test.name,admin_test_path(hospital_test.test)
       end
 
       row :hospital_id do
         link_to hospital_test.hospital.Hname,admin_hospital_path(hospital_test.hospital)
       end
       row :created_at
       row :updated_at
     end
   active_admin_comments
   end
   
   # or
   #
   # permit_params do
   #   permitted = [:hospital_id, :test_id]
   #   permitted << :other if params[:action] == 'create' && current_user.admin?
   #   permitted
   # end
   
end
