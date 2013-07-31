module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
  	# Yuzhe edit: set the database record of remember_token to empty string. Very likely this is insecure. should study the hashing method.
  	#remember_token = User.encrypt(cookies[:remember_token])
  	#cur = User.find_by(remember_token: remember_token)
  	#cur.update_attribute(:remember_token, "")
  	
  	self.current_user = nil;
  	cookies.delete(:remember_token)
  end
end
