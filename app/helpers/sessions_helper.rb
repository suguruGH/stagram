module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) #currentがあったら使う
  end
  
  def logged_in?
    !current_user.nil?
  end
end
