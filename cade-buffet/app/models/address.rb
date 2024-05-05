class Address < ApplicationRecord
  has_one :buffet
  validates :street, :number, :neighborhood, :state, :city, :zip_code, presence: true
  validates :zip_code, format: { with: /\A\d{5}\z/, message: "must be exactly 5 digits" }
end
