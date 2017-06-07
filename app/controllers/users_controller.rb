class UsersController < ApplicationController

  def new
    if current_user
      flash[:success] = "hey you're logged in already..."
      redirect_to "/products"
    else
      @user= User.new
      render 'new.html.erb'
    end
  end
  def edit
    @user = User.find_by(email: params[:email])
  end
  def update
    @user = User.find_by(email: params[:email])
    @user.admin = params[:admin]
    @user.save
     redirect_to "/products/"
     flash[:success] = "The User role has been updated"
  end
  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password], #password_confirmation: params[:passconfirm], 
      admin: false)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "#{user.name} has been sign up"
      redirect_to "/login"
    else
    flash[:error] = "Invalid password or email"
    redirect_to "/signup"
    end
end
end
