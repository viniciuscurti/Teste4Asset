require 'rails_helper'

RSpec.describe Address, type: :model do
  let!(:person) { create(:person) }
  let(:address) { create(:address, person_id: person.id) }

  it "is valid with valid attributes" do
    expect(address).to be_valid
  end

  it "is not valid without a street" do
    address = Address.new(street: nil)
    expect(address).to_not be_valid
  end

  it "is not valid without a city" do
    address = Address.new(city: nil)
    expect(address).to_not be_valid
  end

  it "is not valid without a state" do
    address = Address.new(state: nil)
    expect(address).to_not be_valid
  end

  it "is not valid without a postal_code" do
    address = Address.new(postal_code: nil)
    expect(address).to_not be_valid
  end

  it "is not valid without a country" do
    address = Address.new(country: nil)
    expect(address).to_not be_valid
  end
end
