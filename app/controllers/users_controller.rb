class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)

    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
