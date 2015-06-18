helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

end
