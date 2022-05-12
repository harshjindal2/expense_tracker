class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.string :name
      t.string :amount
      t.string :group

      t.timestamps
    end
  end
end
