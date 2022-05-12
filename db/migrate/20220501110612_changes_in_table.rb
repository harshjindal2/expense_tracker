class ChangesInTable < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :is_admin, :boolean
  end
end
