class AddingStatusInExpenses < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :status, :boolean
  end
end
