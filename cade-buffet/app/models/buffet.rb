class Buffet < ApplicationRecord
  belongs_to :address, optional: true
  has_many :eventos

  validates :commercial_name, :legal_name, :cnpj, :email, :phone, :description, presence: true
  validates :legal_name, :cnpj, :email, uniqueness: true
end
