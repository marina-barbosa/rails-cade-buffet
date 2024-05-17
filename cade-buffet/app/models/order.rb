class Order < ApplicationRecord
  belongs_to :user
  belongs_to :buffet
  belongs_to :event

  validates :status, :guest_count, :date, :event_id, :buffet_id, :user_id, :code, presence: true
  validates :status, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :discount, :extra_fee, :final_value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  enum status: { awaiting_buffet_evaluation: 0, awaiting_customer_confirmation: 1, order_confirmed: 2, order_cancelled: 3 }

  before_validation :set_code, on: :create

  private

  def set_code
    self.code = SecureRandom.alphanumeric(10).upcase if self.code.nil?
  end
end
