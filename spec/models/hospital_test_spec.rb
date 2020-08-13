require 'rails_helper'
RSpec.describe HospitalTest, type: :model do
  before(:all) do
    @hospital_test1=build(:hospital_test,:hospital_id =>'1',:test_id => '3')
  end
  it "should have unique hospital id and test id combination" do
    hospital_test_1=build(:hospital_test,hospital_id: '1',test_id: '1')
    expect(hospital_test_1).to_not be_valid
  end
  it "should have unique hospital id and test id combination" do
  hospital_test_1=build(:hospital_test,hospital_id: '1',test_id: '3')
  expect(hospital_test_1).to be_valid
  end
  
  describe "Associations" do
    it {should belong_to (:test)}
    it {should belong_to (:hospital)}
    it {should have_many(:bookings)}
    it {should have_many(:users).through (:bookings)}
  end
end