class ExpensesController < ApplicationController

     before_action :set_expense
    before_action :require_employee_logged_in!



    def index
        employee = Employee.find_by(id: session[:emp_id])
        @employee_expenses = employee.expenses.order(created_at: :desc)
        # render plain: @employee_expenses
        @total_expense_amt = @employee_expenses.sum(:amount)
    end

    def new
        @expense = Expense.new
    end
    
      def edit

        # if Current.employee.is_admin
        #   render :new_form
      
        # end
      end
    
      def create
        @expense = Expense.new(expense_params)
        @expense.employee = current_employee
        if @expense.save
        #   if @expense.group_id.nil?
        #     redirect_to home_external_path, notice: 'External expense was successfully created.'
        #   else
        #     redirect_to expenses_path, notice: 'Expense was successfully created.'
        #   end
        redirect_to expenses_path, notice: 'Expense was successfully created.'
        else
          render :new
        end
      end

      def update
        if @expense.update(expense_params)
        #   if @expense.group_id.nil?
        #     redirect_to home_external_path, notice: 'External expense was successfully updated.'
        #   else
        #     redirect_to expenses_path, notice: 'Expense was successfully updated.'
        #   end
          if Current.employee.is_admin
            if params[:approve]
            @expense.update(status: true)
            @employee = @expense.employee
            StatusMailer.status_email(@expense,@employee).deliver_now
            redirect_to admin_expenses_path(:employee_id => @expense.employee.id), notice: 'Expense was successfully approved.'
            else
              @expense.update(status: false)
              @employee = @expense.employee
            StatusMailer.status_email(@expense,@employee).deliver_now
            redirect_to admin_expenses_path(:employee_id => @expense.employee.id), alert: 'Expense was successfully rejected.'
            end
            
          else
            redirect_to expenses_path, notice: 'Expense was successfully updated.'
          end
        else
          render :edit
        end
      end
    
      def destroy
        
       
            # StatusMailer.status_email(@expense,@employee).deliver_now
               
            @expense.destroy
            redirect_to admin_expenses_path(:employee_id => @expense.employee.id), alert: 'Expense was successfully deleted.'
            # redirect_to expenses_url, notice: 'Expense was successfully deleted.'
        
      end

      def show
        
        # @expense = Expense.find_by(id: params[:id])
        # render
      end


      def approve

        @expense.status = true
        redirect_to(:back)
        # redirect_to root_path, notice: 'Expense was successfully Approved.'

      end


      def check_invoice_number(expense)
        invoice_number = expense.invoice_number
        if invoice_number%2 == 0
            render plain: "Approved"
        else
            render plain: "Rejected"
        end
      end

      def set_expense
        @expense = Expense.find_by(id: params[:id])
      end

      def expense_params
        params.require(:expense).permit(:name, :amount, :group ,:invoice_number, :status)
      end

end