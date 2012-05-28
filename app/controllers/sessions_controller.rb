class SessionsController < ApplicationController
  def new
  end
  
  def create
    @email = params[:email]
    user = User.find_by_email(@email)
    if user && user.authenticate(params[:password])
      session[:user_id] == user.id
      redirect_to user_url(user), :notice => "Signed in as #{@email}."
    else
      flash[:notice] = 'Sign-in unsuccessful.'
      render 'new'
    end
  end
  
  def destroy
  end
end