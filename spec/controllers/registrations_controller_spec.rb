require 'rails_helper'
RSpec.describe RegistrationsController,:type => :controller do
  before :each do
    request.env['devise.mapping']=Devise.mappings[:user]
  end
  describe "GET #new" do
    it "should be successful" do
      get :new
      response.should be_successful
    end
  end
 
end