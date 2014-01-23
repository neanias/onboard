class SessionsController < ApplicationController

  # Sessions are the way the browser tracks me
  # we want to manage them in our app
  # sessions controller deals with this stuff

  def new
    # Log in form
  end

  def create
    # Do the log in

    # I want to find the username and password typed in
    @username = params[:session][:username]
    @password = params[:session][:password]

    # Then I want to see if there's a user with that username
    @user = User.find_by_username(@username)

    # If there is, check their password as well
    if @user.present? && @user.authenticate(@password)
      # If it matches, give them the session
      session[:user_id] = @user.id
      flash[:success] = "You have logged in"
      redirect_to root_path
    else
      flash[:error] = "Wrong username/password"
      # If not, show the new page
      render 'new'
    end



  end

  def destroy
    # a.k.a. log out
    reset_session
    flash[:success] = "You've logged out"
    redirect_to root_path
  end

end
