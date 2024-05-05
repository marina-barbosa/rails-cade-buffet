class Order < ApplicationRecord
  belongs_to :user
  belongs_to :buffet
  belongs_to :event

  validates :description, :status, :guest_count, :date, :event_id, :buffet_id, :user_id, :code, presence: true
  validates :discount, :extra_fee, :final_value, :status, :guest_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum status: { awaiting_buffet_evaluation: 0, order_confirmed: 1, order_cancelled: 2 }

  before_create :set_code

  private

  def set_code
    self.code = SecureRandom.alphanumeric(10).upcase if self.code.nil?
  end
end
