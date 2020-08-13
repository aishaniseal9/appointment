require "rails_helper"

RSpec.describe WelcomeController,type: :controller do
  describe "Get Welcome#index" do
    it "should show the welcome index page" do
    expect(response).to have_http_status(:success)
   
  end
end
  end