ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :contactno, :address, :dob, :bloodgrp, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :contactno, :address, :dob, :bloodgrp, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :all, except: [:update,:new,:edit, :destroy]
  #default_fields :name, :contactno, :address, :dob, :bloodgrp, :email
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :contactno, :address, :dob, :bloodgrp, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :admin
   index do
    selectable_column
    column :id
    column :name
    column :contactno
    column :address
    column :dob
    column :email
    column :bloodgrp
    actions defaults: false do |post|
      item "View", admin_user_path(post)
    end
  end
    show do
      attributes_table :name,:contactno,:address,:dob,:email,:bloodgrp
     # table_for user.bookings do
       #column  'Booking Name',:id
        #column 'Test Name',Test.first.name
        
        #end
      active_admin_comments
      
    end
     
  # or
  #
  # permit_params do
  #   permitted = [:name, :contactno, :address, :dob, :bloodgrp, :registerstatus, :loggedstatus, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
