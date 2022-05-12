class Expense < ApplicationRecord
  belongs_to :employee

  validates :invoice_number ,presence: true
  validates :name ,presence: true
  validates :amount ,presence: true
  validates :group ,presence: true
  

end
