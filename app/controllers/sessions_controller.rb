class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if sign_in(user, params[:session][:password])
      flash[:success] = "Hello, #{current_user.name}!"
      url = session.delete(:pre_signin_url)
      redirect_to url || root_url
    else
      flash.now[:error] = 'Wrong password or email'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
