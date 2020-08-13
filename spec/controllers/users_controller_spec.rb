require 'rails_helper'
RSpec.describe UsersController,:type => :controller do
  describe "get users#index" do
    it "should return index page" do
    expect(response).to have_http_status(:success)
  end
  end
  describe "get users#show" do
    it "should render the show page" do
      user=User.find(2)
    get :show,params: {id: user.id}
      hospitals=HospitalTest.all
      bookings=user.bookings
    expect(response).to have_http_status(:success)
  end
end
  describe "get users#new" do
    render_views 
    it "should render the new page" do
      
      expect { get :new, :format => :html }.to_not raise_error
    end
  end
 
end