class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      sign_in(@user)
    else
      flash.now[:errors] = ["Invalid username or password"]
    end
    redirect_to root_url
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end