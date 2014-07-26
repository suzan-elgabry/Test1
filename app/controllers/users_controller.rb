class UsersController < ApplicationController
before_filter :sign_in_user, only: [:index, :edit, :update]
 before_filter :correct_user, only: [:edit, :update]
 before_filter :admin_user, only: :destroy
  
	def index
		@users= User.paginate(page: params[:page], :per_page=> 5)

	end


  def new
  	@user =User.new
  end

  def show
  	@user = User.find(params[:id]).paginate(:page => params[:page], :per_page => 5)
  	
   
  end

 def create 
 	@user =User.new(user_params)
 	if @user.save
 		sign_in @user
 		flash[:notice]= "User successfully created"
 		redirect_to user_path(@user)
 	else
 		render 'new'
	end
end

def edit
end

def update
	@user = User.find(params[:id])
	if @user.update_attributes(user_params)
		sign_in @user
		flash[:notice]= "Profile Updated"
		redirect_to user_path(@user)
		else

		render 'edit'
	end

end

 def destroy 
	User.find(params[:id]).destroy
	flash[:success] = "User destroyed"
	redirect_to users_path
 end

def sign_in_user
	unless signed_in?
		store_location
		flash[:ntoice] = "Please Sign in"
		redirect_to root_path 
	end
end

def correct_user
@user = User.find(params[:id])
redirect_to root_path unless current_user?(@user)
end


def admin_user
	redirect_to root_path unless current_user.admin?
end

private 
def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end



end

