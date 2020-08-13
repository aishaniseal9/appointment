ActiveAdmin.register Test do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :testdescription, :testamount
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :testdescription, :testamount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :testdescription, :testamount,hospital_ids: [],hospital_tests_attributes: [:id,:hospital_id,:test_id,:_destroy]
  index do
    selectable_column
    column :id
    column :name
    column :testdescription
    column :testamount
    column :created_at
    column :updated_at
    column "Hospitals Associated" do |test|
      test.hospital_tests.map{|hospital| hospital.hospital.Hname if hospital }.compact
    end
    actions defaults: true 
  end
    show title: :name  do |test|
      attributes_table do
        row :id
        row ('Name') { |r| r.name} 
        row ('Test Description') { |r| r.testdescription}
        row ('Test Amount') { |r| r.testamount}
        end
        table_for test.hospitals do
        column  'Hospital Name',:Hname
        
        end
        active_admin_comments
    end
  form do |f|
    #f.semantic_errors * f.object.errors.keys
    f.inputs "Tests" do
      f.input :name
      f.input :testdescription
      f.input :testamount
     
      f.has_many :hospital_tests,allow_destroy: true do |n_f|
        n_f.input :hospital,collection:Hospital.all.map{|hospital| [hospital.Hname,hospital.id]}
      end
    end
    f.actions
  end

end
