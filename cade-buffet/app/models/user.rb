class User < ApplicationRecord
  has_one :buffet
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 2 }

  validates :cpf, presence: true, format: { with: /\A\d{11}\z/, message: "deve conter apenas números e ter 11 dígitos" }

  validates :owner, inclusion: { in: [true, false] }
end
