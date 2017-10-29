class SessionsController < ApplicationController
  def new
  end

  def create
    user = Teacher.find_by( email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.first_name}"
      redirect_to root_path
    else
      flash.now[:alert] = "Your username or password is incorrect."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out"
  end
  private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
