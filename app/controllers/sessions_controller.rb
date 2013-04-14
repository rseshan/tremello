class SessionsController < ApplicationController
	skip_before_filter :login_required, :except => "destroy"
	
	def new
	end

	def create
		
		@musician = Musician.find_by_email(params[:email])
		if @musician && @musician.authenticate(params[:password])
			login(@musician) 
			redirect_to @musician, :notice => 'Logged in!'
		else
			redirect_to login_path, :notice => 'Invalid email or password'				

		end
	end

	def destroy
		logout
		redirect_to login_path, :notice => 'Logged out!'
	end



end
