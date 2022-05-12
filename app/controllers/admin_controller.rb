class AdminController < ApplicationController

    before_action :set_current_emp
    before_action :require_employee_logged_in!
    before_action :check_admin

     def index
        # @employee = Employee.all
        # render plain: Employee.all
        # user = Employee.find_by(id: params[:id])
        # Current.user = user
        # authorize user, policy_class: EmployeesPolicy
        # @employees = Employee.all
        # render :show_employees

        if Current.employee.is_admin
        employee = Employee.find_by(id: params[:id])
        Current.employee = employee
        @employees = Employee.all
        
        render :index
        else
        render plain: "Only Admin Can Visit This Page"
        end
     end

     def expenses

        @employee_id = Employee.find(params[:employee_id])
        @employee_expenses = @employee_id.expenses.order(created_at: :desc)
        @total_expense_amt = @employee_expenses.sum(:amount)
         #render plain: @employee_id

     end


end
