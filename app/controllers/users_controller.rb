class UsersController < ApplicationController
  before_action :make_sure_signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :make_sure_correct_user, only: [:show, :edit, :update]
  before_action :make_sure_admin_user, only: :destroy

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
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

  private
    def make_sure_correct_user
      user = User.find(params[:id])
      redirect_to(root_url) unless equal_to_current_user?(user)
    end

    def make_sure_signed_in_user
      unless signed_in_user
        redirect_to login_url, notice: "Please sign in."
      end
    end

    def make_sure_admin_user
      if not admin_signed_in?
        redirect_to root_url, notice: "You need to have admin privileges to do that."
      end
    end
end
