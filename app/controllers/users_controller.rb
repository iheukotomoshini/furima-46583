class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to some_path
    else
      @unique_errors = @user.errors.full_messages.uniq
      render :new
    end
  end
end
