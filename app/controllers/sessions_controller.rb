# frozen_string_literal: true

# sessions controller
class SessionsController < ApplicationController
  def new
    redirect_to notes_path if current_user
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to notes_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, notice: 'Logged out!'
  end
end
