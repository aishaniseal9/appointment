require 'rails_helper'

RSpec.describe Hospital, type: :model do
  before(:all) do
    @hospital1=create(:hospital)
  end
  it "is valid with valid attributes" do
    expect(@hospital1).to be_valid
  end
  it "has a unique email" do
    hospital2=build(:hospital,email: 'contactus.apollo@gmail.com')
    expect(hospital2).to_not be_valid
  
  end
  it "has a unique contact" do
    hospital2=build(:hospital,contact: '9546789189')
    expect(hospital2).to_not be_valid
  end
  it "has a Hospital name" do
    hospital2=build(:hospital,Hname: nil)
    expect(hospital2).to_not be_valid
  end
  it "has a Hospital address" do
    hospital2=build(:hospital,Haddress: nil)
    expect(hospital2).to_not be_valid
  end
  it "has a Hospital contact" do
    hospital2=build(:hospital,contact: nil)
    expect(hospital2).to_not be_valid
  end
  it "has a Hospital email" do
    hospital2=build(:hospital,email: nil)
    expect(hospital2).to_not be_valid
  end
  it "has a Hospital website" do
    hospital2=build(:hospital,website: nil)
    expect(hospital2).to_not be_valid
  end
  it "has a certain no_of_test" do
    hospital2=build(:hospital,no_of_test:nil)
    expect(hospital2).to_not be_valid
  end

  describe "Associations" do
    it {should have_many(:hospital_tests).dependent(:destroy)}
    it {should have_many(:tests).through (:hospital_tests)}
    it {should accept_nested_attributes_for(:hospital_tests)}
  end
end