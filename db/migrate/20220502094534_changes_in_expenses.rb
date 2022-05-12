class ChangesInExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :invoice_number, :integer
  end
end
