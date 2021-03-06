class UsersController < ApplicationController

	def index
		@users = User.all
	end

  	def show
    	@user = User.find(params[:id])
    end	

  	def edit
    	@user = User.find(params[:id])
 	end

 	def update
 		@user = User.find
 		if @user.update_attributes(user_params)
 			redirect_to user_path
 		else
 			render 'edit'
 		end
 	end

 	def new
 		@user = User.new
 	end

 	def create
 		@user = User.new(user_params)
 		if @user.save
 			redirect_to users_url
 		else
 			render 'new'
 		end 
 	end

 	def destroy
 		@user = User.find(params[:id])
 		@user.destroy
 		redirect_to users_url
 	end

 	def user_params
 		params.require(:user).permit(:name, :email, 
 		:password, :location, :age, :description )
 	end

end
