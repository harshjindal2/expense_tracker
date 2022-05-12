class SessionsController < ApplicationController
    def new 

        if Current.employee
           # render plain: "Already Logged in"
            render html: helpers.tag.strong('Already Logged in')
        end

    end

    def create
        employee = Employee.find_by(email: params[:email] )

        if employee.present? && employee.authenticate(params[:password])
            session[:emp_id] = employee.id

            if employee.is_admin
                redirect_to admin_path,notice: "Logged In Successfully"
            else 
                redirect_to root_path,notice: "Logged In Successfully"
            end
        else
            
            render :new
            flash[:alert] = "Incorrect email Or password"
        end

    end

  
    def destroy
        session[:emp_id] = nil
       redirect_to root_path, alert: "Logged Out"
    end

end
