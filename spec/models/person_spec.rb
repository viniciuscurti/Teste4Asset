require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { create(:person) }

  it "is valid with valid attributes" do
    expect(person).to be_valid
  end

  context "when a person is not valid" do
    let(:person) { build(:person, name: nil, email: nil, phone: nil, birthdate: nil) }

    it "is not valid without a name" do
      expect(person).to_not be_valid
    end

    it "error messages" do
      person.valid?
      expect(person.errors[:name]).to include("can't be blank")
      expect(person.errors[:email]).to include("can't be blank")
      expect(person.errors[:phone]).to include("can't be blank")
      expect(person.errors[:birthdate]).to include("can't be blank")
    end
  end
end
