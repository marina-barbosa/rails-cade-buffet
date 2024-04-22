class AddPaymentMethodsIdToBuffets < ActiveRecord::Migration[7.1]
  def change
    add_reference :buffets, :payment_methods, null: false, foreign_key: true
  end
end
