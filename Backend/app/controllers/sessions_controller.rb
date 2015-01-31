class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    session[:user_name] = user.name
    flash[:notice] = 'Signed in!'
    redirect_to root_url
  end

  def destroy
    reset_session
    flash[:notice] = 'Signed out!'
    redirect_to root_url
  end

  def failure
    flash[:alert] = "Authentication error: #{params[:message].humanize}"
    redirect_to root_url
  end

end
