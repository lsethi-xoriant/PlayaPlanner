class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      current_user.move_to(@user) if current_user.try(:guest)
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