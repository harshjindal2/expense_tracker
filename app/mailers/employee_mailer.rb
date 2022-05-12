class EmployeeMailer < ApplicationMailer

    default from: 'harshmain@gmail.com'

    def welcome_email(employee)
        @employee = employee
       
       mail(to: @employee.email, subject: 'Welcome to expense tracker app' )
    end

end
