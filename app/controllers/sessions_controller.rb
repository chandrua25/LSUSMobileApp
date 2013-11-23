class SessionsController < ApplicationController
 
  def new
  end

  def create
	#@password = Player.authenticate(params[:session][:playerid], params[:session][:password])
	#render '/players/test'
	
	student = Student.find_by_username(params[:session][:username])
	if student && Student.authenticate(params[:session][:username], params[:session][:password])
		if signed_in?
			redirect_to student_home_path  #   subjects#index
		else
			sign_in student
			redirect_to student_home_path
		end
	else 
		flash[:error] = 'Invalid email/password combination'
		render 'new'
	end

  end

  def destroy
    sign_out
    redirect_to signin_path
  end
  
end
