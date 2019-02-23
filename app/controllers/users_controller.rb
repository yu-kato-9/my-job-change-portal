class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :correct_user, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confimation)
  end

  
  def correct_user
    #binding.pry
    unless current_user.id.to_s == params[:id]
      redirect_to current_user
    end
  end

end

