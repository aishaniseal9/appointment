ActiveAdmin.register Hospital do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :Hname, :Haddress, :contact, :email, :website, :no_of_test
  #
  # or
  #
  # permit_params do
  #   permitted = [:Hname, :Haddress, :contact, :email, :website, :no_of_test]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :Hname,:Haddress,:contact,:email,:website,:no_of_test,hospital_tests_attributes: [:id,:hospital_id,:test_id,:_destroy]
  index do
    selectable_column
    column :id
    column "Hospital Name" ,:Hname 
    column "Address" ,:Haddress
    column :contact
    column :email
    column :website
    column :no_of_test
    column :created_at
    column :updated_at
    column "Tests Associated" do |hospital|
      hospital.hospital_tests.map{|test| test.test.name if test}.compact
    end
    actions defaults: true 
    end
    show title: :Hname  do |hospital|
      attributes_table do
        row :id
        row ('Name') { |r| r.Hname}  
        row ('Address') { |r| r.Haddress}  
        row :contact
        row :email
        row :website
        row :no_of_test
        row :created_at
        row :updated_at
        
       # columns 'Associated tests' do |hospital|
           #hospital.hospital_tests.map{|test| test.test.name if test}.compact
       # end
        end
        table_for hospital.tests do
        column :name
        column 'Test Description' ,:testdescription
        column 'Test Amount', :testamount
        end
    
        active_admin_comments
    end
    form do |f|
      f.inputs 'New Hospital' do
      f.input :Hname , label: 'Hospital Name'
      f.input :Haddress, label: 'Address'
      f.input :contact
      f.input :email
      f.input :website
      f.input :no_of_test
      f.has_many :hospital_tests,allow_destroy: true do |n_f|
        n_f.input :test
      end
    end
      f.actions
    end
end
