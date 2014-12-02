class UsersController < ApplicationController
	def index
		@users = User.all
	end
	
	def new
		@users = User.new
	end
	
	def create
	    @users = User.new(user_params)

	    if @users.save
	      redirect_to '/', notice: 'Awesome!'
	    else
	      flash[:notice] =  @users.errors.full_messages.to_sentence
	      render 'new'
    	end
  	end

  	def update
		@users = User.find(params[:id])
		puts @users

		if @users.update_attributes(user_params)
			redirect_to '/'
			puts 'saved'
		else
			puts 'not'
			flash[:notice] = @users.errors.full_messages.to_sentence
			render :edit
		end
	end
  	
  	def show
    	@users = User.find(params[:id])
  	end

  	def edit
		@users = User.find(params[:id])
	end

	def destroy
		@users = User.find(params[:id])
		@users.destroy
		redirect_to '/'
	end

  	private

  	def user_params
  	  params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :phone_number, :url)
  	end
end