class NerdsController < ApplicationController
  before_action :set_nerd, only: [:edit, :update, :destroy]
  before_action :set_body_class

  def index
  end

  def new
    @nerd = Nerd.new
  end

  def create
    @nerd = Nerd.new(nerd_params)
    @nerd.name.downcase!
    @nerd.email.downcase!
    
    if @nerd.save
      session[:nerd_id] = @nerd.id
      redirect_to :root
    else
      render :new, notice: 'Your nerd did not save, sorry!'
    end
  end

  def edit
    if @nerd.present?
    else
      redirect_to :root
    end
  end

  def update
    set_nerd
    if @nerd.update(nerd_params)
      redirect_to :root
    else
      render :edit, notice: 'Your nerd did not save, sorry!'
    end
  end

  def destroy
    @current_nerd.destroy
    session[:nerd_id] = nil
    redirect_to :root
  end

  private

  def set_body_class
    @body_class = 'nerds'
  end

  def set_nerd
    @nerd = current_nerd
  end

  def nerd_params
    params.require(:nerd).permit(:name, :email, :password, :password_confirmation)
  end

end
