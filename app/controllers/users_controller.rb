class UsersController < ApplicationController
  before_action :find_user,only:[:show,:edit,:update,:destroy]
  before_action :correct_user,only:[:edit,:update,:destroy]


  def new
    @user=User.new
  end

  def show

  end

  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]='Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success]='Account updated.'
      redirect_to @user
    else
      flash[:danger]='Something Wrong!'
      render 'edit'
    end
  end

  def index
    @users = User.all.paginate(page:params[:page],per_page:20)
  end

  def destroy
    @user.destroy
    flash[:success] = 'User Delete'
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to login_path unless @user == current_user || current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end


end
