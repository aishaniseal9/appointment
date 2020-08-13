require 'rails_helper'

RSpec.describe HospitalsController, :type => :controller do
  describe "get hospitalss#index" do
    it "should return index page" do
    expect(response).to have_http_status(:success)
  end
  end
  describe "get hospitalss#show" do
    it "should render the show page" do
      hospital=Hospital.find(1)
    get :show,params: {id: hospital.id}
    expect(response).to have_http_status(:success)
  end
end
  describe "get hospitals#new" do
    render_views 
    it "should render the new page" do
      
      expect { get :new, :format => :html }.to_not raise_error
    end
  end
  describe "Post tests#create" do
    it "should create a new test" do
      test=create(:hospital)
        expect(response).to be_successful
    end
  end
  describe "Get hospitals#edit" do
    render_views
    it "should render the edit page " do
      expect { get :edit ,params: {id: '1'},:format => :html}.to_not raise_error
    expect(response).to be_successful
    end 
  end
  
  describe "DELETE 'destroy'" do
    before :each do
      @hospital=Hospital.find('1')
    end
   it "deletes the hospital" do
    expect{
      delete :destroy,params: {id: @hospital}
    }.to change(Hospital,:count).by(-1)
   end
   it "redirects to hospitals#index page" do
     delete :destroy,params: {id: @hospital}
     response.should redirect_to  hospitals_path
   end

 end
end