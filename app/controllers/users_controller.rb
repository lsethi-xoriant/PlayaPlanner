class UsersController < ApplicationController
  before_filter :require_signed_out!, :only => [:create, :new]

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end