class UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end
  def create
    user = User.new(name:params[:name], email: params[:email], password: params[:password], password_confirmation: params[:passconfirm])
    if user.save
      session[:user_id] = user.id
      flash[:success] = "#{user.name}has been sign up"
      redirect_to "/products"
    else
    flash[:error] = "Invalid password or email"
    redirect_to "/signup"
    end
end
end
