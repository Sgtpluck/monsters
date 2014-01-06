class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  def index
    @body_class = 'monsters'
    @monsters = Monster.find_monsters(params[:cr], params[:environment], params[:search_monsters]).page(params[:page])
  end

  def new
    @body_class = 'make_monster'
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    if @monster.save
      redirect_to monsters_path, notice: 'Your monster is ready to eat some adventurers.'
    else
      render :new, notice: 'That monster needs some more work!'
    end
  end

  def show
    @body_class = 'show_monsters'
  end

  def edit
    redirect_to monsters_path if @current_nerd.name != 'davida'
  end

  def update
    if @monster.update(monster_params)
      redirect_to monster_path
    else
      render :edit, notice: 'Your monster needs some work!'
    end
  end

  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :type, :cr, :environment, :description, :photo, :exp, :visual_desc)
  end
end
