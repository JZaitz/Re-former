class UsersController < ApplicationController
  
  def index
    @users = User.all 
    @events = Event.all
    
  end
  
  def new
    @user = User.new 
  end
  
  def show
    @user = User.find(params[:id])
    @event = Event.new
    @event.user_id = @user.id
  end 

  def create
    
    @user = User.new(user_params)
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Password is not long enough.'
      render :new

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes user_params
      flash[:notice] = 'The User is successfully updated'
      redirect_to user_path(@user)
    else
      render :edit 
    end
  end
  
  def destroy
        @user = User.find(params[:id]).destroy
        flash.notice = "User has been deleted."
        redirect_to users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
