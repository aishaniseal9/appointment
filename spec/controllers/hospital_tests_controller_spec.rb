require 'rails_helper'

RSpec.describe HospitalTestsController, :type => :controller do
  describe "get hospitaltests#index" do
    it "should return index page" do
    expect(response).to have_http_status(:success)
  end
  end
  describe "get hospitaltests#show" do
    it "should render the show page" do
      hospital_test=HospitalTest.find(1)
    get :show,params: {id: hospital_test.id}
    expect(response).to have_http_status(:success)
  end
end
  describe "get hospitaltests#new" do
    render_views 
    it "should render the new page" do
      
      expect { get :new, :format => :html }.to_not raise_error
    end
  end
  describe "Post hospitaltests#create" do
    it "should create a new hospital test association" do
      expect{
        post :create ,params: {:hospital_test=>{:test_id => "3",:hospital_id => "1"}}
      }.to change(HospitalTest,:count).by(1)
      
        response.should redirect_to HospitalTest.last
    end
  end
  describe "Get hospitaltests#edit" do
    render_views
    it "should render the edit page " do
      expect { get :edit ,params: {id: '1'},:format => :html}.to_not raise_error
    expect(response).to be_successful
    end 
  end
  
  

  describe "DELETE 'destroy'" do
     before :each do
       @hospitaltest=HospitalTest.find('1')
     end
    it "deletes the hospital test association" do
     expect{
       delete :destroy,params: {id: @hospitaltest}
     }.to change(HospitalTest,:count).by(-1)
    end
    it "redirects to hospitaltest#index page" do
      delete :destroy,params: {id: @hospitaltest}
      response.should redirect_to  hospital_tests_path
    end

  end
end