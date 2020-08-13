require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1=create(:user)
  end
  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end
  it "has a unique email" do
    user2=build(:user,email:'aishaniseal@gmail.com')
    expect(user2).to_not be_valid
  end
  it "has a different name but used email" do
    user2=build(:user,name:'Archita Seal',email: 'aishaniseal@gmail.com')
    expect(user2).to_not be_valid
end
  it "has a unique contact" do
    user2=build(:user,contactno: '9748848508')
    expect(user2).to_not be_valid
  end
  it "has a name" do
    user2=build(:user,name: nil)
    expect(user2).to_not be_valid
  end
  it "has a address" do
    user2=build(:user,address: nil)
    expect(user2).to_not be_valid
  end
  it "has a contact" do
    user2=build(:user,contactno: nil)
    expect(user2).to_not be_valid
  end
  it "has a valid contact" do
    user2=build(:user,contactno: "983465")
    expect(user2).to_not be_valid
  end
  it "has a valid email" do
    user2=build(:user,email: "abc")
    expect(user2).to_not be_valid
  end
  it "has a date of birth" do
    user2=build(:user,dob: nil)
    expect(user2).to_not be_valid
  end
  it "has a blood grp" do
    user2=build(:user,bloodgrp: nil)
    expect(user2).to_not be_valid
  end
  it "has a valid blood grp" do
    user2=build(:user,bloodgrp: "ABB")
    expect(user2).to_not be_valid
  end
  describe "valid date" do
    it "validates the date of birth" do
      user2=build(:user,dob: "2020-09-18")
      user2.valid?
      expect(user2.errors[:base]).to include('Date is beyond current date,u Cannot be born')
      user3=build(:user, dob: "1999-12-04")
      user3.valid?
      expect(user3.errors[:base]).to_not include('Date is beyond current date,u Cannot be born')
    end
  end
  describe "Associations" do
    it {should have_many(:bookings)}
    it {should have_many(:hospital_tests).through (:bookings)}
  end
end
