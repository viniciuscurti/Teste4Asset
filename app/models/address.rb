class Address < ApplicationRecord
  belongs_to :person, optional: true, dependent: :destroy
end
