class SessionsController < ApplicationController
  # before_action :reset_session, only: [:new, :edit, :show]
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to pictures_path
      puts "ok"
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
  
  private
  
  def reset_session
  end
  
  
end
