require "rails_helper"
RSpec.describe SearchesController,type: :controller do
  describe "Get Search#new" do
    it "should render the new html page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end  
    describe  "Get #Show" do
      
        let (:search) {create (:search)}
        it "should show field" do
          get:show ,params: {id: search.id}
          expect(response.status).to eq(200)
        end
      end
      describe "POST CREATE for search" do
        context "with valid attributes" do
          it "creates a new search" do
            expect{
              post :create,params:{:search=>{:test_name => "FNAC Test1",:hospital_name => "Apollo"}}
            }.to change(Search,:count).by(1)
          end
          
        end
      end
  
end
