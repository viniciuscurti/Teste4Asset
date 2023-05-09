class Address < ApplicationRecord
  belongs_to :person
  validates_presence_of :street, :city, :state, :country, :person_id, :postal_code
end
