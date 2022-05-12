class EmployeesController < ApplicationController
   def index
   end

   def new

    if Current.employee
        # render plain: "Already Logged in"
         render html: helpers.tag.strong('Already Logged in')
     end
      @employee = Employee.new


   end

   def create
      #render plain: get_emplyoee
      @employee = Employee.new(get_employee)

      
      if @employee.save
        session[:emp_id] = @employee.id
        EmployeeMailer.welcome_email(@employee).deliver_now
         
         redirect_to root_path, notice: 'employee was successfully created.' 
       # format.json { render json: @employee, status: :created, location: @employee }
       # redirect_to root_path ,notice: "Account Created Successfully"
      else
        # format.html { render action: 'new' }
        # format.json { render json: @employee.errors, status: :unprocessable_entity }
      render :new
      end
    
   end

  

private

def get_employee
    
    params.require(:employee).permit(:name,:email,:password,:password_confirmation)

end

end