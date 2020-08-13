require 'rails_helper'

RSpec.describe Test, type: :model do
  before(:all) do
    @test1=create(:test)
  end
  it "is valid with valid attributes" do
    expect(@test1).to be_valid
  end
  it "has a unique testname" do
    test2=build(:test,name: 'FNAC test')
    expect(test2).to_not be_valid
  
  end
  it "has a test amount" do
    test2=build(:test,testamount: nil)
    expect(test2).to_not be_valid
  end
  it "has a test name" do
    test2=build(:test,name: nil)
    expect(test2).to_not be_valid
  end
  describe "Associations" do
    it {should have_many(:hospital_tests).dependent(:destroy)}
    it {should have_many(:hospitals).through (:hospital_tests)}
    it {should accept_nested_attributes_for(:hospital_tests)}
  end
end
