class Person < ApplicationRecord
  has_one :address
  validates_presence_of :name, :email, :phone, :birthdate
end
