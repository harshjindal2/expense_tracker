class ApplicationController < ActionController::Base

    before_action :set_current_emp

    include Pundit

    def set_current_emp
    if session[:emp_id]
        Current.employee = Employee.find_by(id: session[:emp_id])
    end

    end

    def current_employee
        current_employee = Current.employee
    end

    def require_employee_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.employee.nil?
    end

    def check_admin
         is_admin = Current.employee.is_admin
    end


end
