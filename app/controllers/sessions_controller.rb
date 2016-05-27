class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].strip.downcase)
    if user && user.authenticate(params[:password])
        log_in user
        flash["notice"] = "Welcome back, #{user.name}"
        redirect_to books_url
        return
    else
      flash.now[:error] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to books_url
  end

end
