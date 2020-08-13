require 'rails_helper'

RSpec.describe TestsController, :type => :controller do
  describe "get tests#index" do
    it "should return index page" do
    expect(response).to have_http_status(:success)
  end
  end
  describe "get tests#show" do
    it "should render the show page" do
      test=Test.find(1)
    get :show,params: {id: test.id}
    expect(response).to have_http_status(:success)
  end
end
  describe "get tests#new" do
    render_views 
    it "should render the new page" do
      
      expect { get :new, :format => :html }.to_not raise_error
    end
  end
  describe "Post tests#create" do
    it "should create a new test" do
      test=create(:test,name:"FNAC3",testamount:"120")
        expect(response).to be_successful
    end
  end
  describe "Get tests#edit" do
    render_views
    it "should render the edit page " do
      expect { get :edit ,params: {id: '1'},:format => :html}.to_not raise_error
    expect(response).to be_successful
    end 
  end
  describe "Put Update" do
    before :each do
      @test = FactoryBot.attributes_for(:test,:name => "ABC",:testamount => "200")
  
      context "valid attributes" do
        it "found the requested @test" do
          put :update, params: {id: @test},test:FactoryBot.attributes_for(:test,:name => "ABC",:testamount => "200")
          assigns(:hospitaltest).should eq(@test)
        end
      it "changes the attributes" do
        put :update ,params: {id: @test },test:FactoryBot(:test,:testamount => "250")
        @test.reload
        @test.test_amount.should eq ("250")

      end
      it "redirects to the updated test page" do
        put :update , params: {id: @test},hospitaltest:FactoryBot.attributes_for(:test)
        response.should redirect_to @test
      end
    end
  end
end
  describe "DELETE 'destroy'" do
     before :each do
       @test=Test.find('1')
     end
    it "deletes the test" do
     expect{
       delete :destroy,params: {id: @test}
     }.to change(Test,:count).by(-1)
    end
    it "redirects to test#index page" do
      delete :destroy,params: {id: @test}
      response.should redirect_to  tests_path
    end

  end
end