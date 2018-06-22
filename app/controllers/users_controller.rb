class UsersController < ApplicationController
  def index
  end

  def create
  	@user = User.create(user_params)
  	session[:id] = @user.id          ####doing this Welcomes new registered user instead of the last logged in user. 

  	if @user.valid? 
  		redirect_to "/products"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'	
  	end	
  end

	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end

