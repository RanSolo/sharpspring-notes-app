# frozen_string_literal: true

# users controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'Signed up!'
    else
      render 'new'
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :password_hash,
      :password_salt,
      :first_name,
      :last_name
    )
  end
end
