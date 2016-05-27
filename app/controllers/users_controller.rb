class UsersController < ApplicationController
  before_action :make_sure_signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :make_sure_correct_user, only: [:show, :edit, :update]
  before_action :make_sure_admin_user, only: :destroy

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Book Reviews App!"
      redirect_to books_url
    else
      render :new
    end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_url
  end

end
