class StatusMailer < ApplicationMailer

    default from: 'harshmain@gmail.com'

    def status_email(expense,employee)

        @expense = expense
        @employee = employee
        mail(to: @employee.email, subject: 'Status regarding your expense' )

    end

end
