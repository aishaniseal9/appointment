require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "valid booking date" do
    it "should have valid booking date" do
      booking2=build(:booking,bookingdate: "2020-09-18")
      booking2.valid?
      expect(booking2.errors[:base]).to_not include("You cannot book appointment for a past date")
      booking3=build(:booking, bookingdate: "1999-12-04")
      booking3.valid?
      expect(booking3.errors[:base]).to include("You cannot book appointment for a past date")
    end
  end
  before(:all) do
    @booking1=create(:booking,:hospital_test_id =>'1',:user_id => '2')
  end
  it "is valid with valid attributes " do
    expect(@booking1).to_be valid
  end
  it "should have unique user id and hospital_test id combination" do
    hospital_test_1=build(:booking,hospital_test_id: '1',user_id: '2')
    expect(hospital_test_1).to_not be_valid
  end
  it "should have unique hospital id and test id combination" do
  hospital_test_1=build(:booking,hospital_test_id: '1',user_id: '3')
  expect(hospital_test_1).to be_valid
  end
  it "should have unique hospital id and test id combination" do
    hospital_test_1=build(:booking,hospital_test_id: '3',user_id: '2')
    expect(hospital_test_1).to be_valid
    end
  describe "Associations" do
    it {should belong_to (:user)}
    it {should belong_to (:hospital_test)}
  
  end
end