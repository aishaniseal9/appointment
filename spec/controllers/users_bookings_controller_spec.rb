require 'rails_helper'

RSpec.describe Users::BookingsController, :type => :controller do
  sign_me_in
  describe "Post #create and #show" do
    it "shows the bookings of user" do
      user=FactoryBot.create(:user,:name => "abc",:contactno => "9765432101",:address => "Hatibagan",:email => "abc@gmail.com",:password => "abcdef",:dob =>"1999-12-14")
      booking= FactoryBot.create(:booking,:bookingdate => "2020-08-15",hospital_test_id: '1',:user_id => user.id)
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in :user, user
      get :index, params: {user_id:user} 
      expect(assigns(:bookings)).to eq([booking])
    end
  end
  describe "DELETE 'destroy'" do
    
   it "deletes the booking" do
      expect{
      delete :destroy,params: {:user_id => '2',id: '1'}
      
     }.to change(Booking,:count).by(-1)
   end
   it "redirects to users#index page" do
    delete :destroy,params: {:user_id=> '2',id: '1'}
    response.should redirect_to  user_path(id:'2')
  end

 end

end