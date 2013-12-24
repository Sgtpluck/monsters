class SessionsController < ApplicationController

  def new
    if session[:nerd_id]
      redirect_to '/'
    else
      @nerd = Nerd.new
    end
  end

  def sign_in
    nerd = Nerd.find_by_name(params[:name])
    if nerd && nerd.authenticate(params[:password])
      session[:nerd_id] = nerd.id
      redirect_to '/', notice: "You are now signed in!"
    else
      render :new, notice: "Sorry, nerd, you gave me an invalid name or password!" #this notice doesn't work. Figure out why!
    end
  end

  def destroy
    session[:nerd_id] = nil
    redirect_to '/', notice: 'See ya next time!'
  end


end
