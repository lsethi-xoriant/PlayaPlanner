class SessionsController < ApplicationController
  before_action :require_signed_out!, :only => [:new, :create]
  before_action :require_signed_in!, :only => [:destroy]

  def new
  end

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
end