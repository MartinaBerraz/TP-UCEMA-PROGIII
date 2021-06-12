class PrendasController < ApplicationController

  before_action :set_prenda, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!
  # get /prendas/
  def index

    @prendas = Prenda.all.page params[:page]

  end


  # get /prendas/:id
  def show
  end



  # post /prendas
  def create
    Prenda.create! prenda_params # nota: prenda_params NO viene con el controller,
    # lo tenés que definir vos
    redirect_to action: :index
  end

  # get /prendas/new
  def new
    @prenda = Prenda.new

  end

  # put /prendas/:id
  def update
    @prenda.update! prenda_params
    redirect_to @prenda
  end

  # get /prendas/edit
  def edit
  end


  def destroy
    @prenda.destroy!
    redirect_to :action => :index
  end


  private

  def set_prenda
    @prenda = Prenda.find(params[:id])
  end

  def prenda_params

    params.require(:prenda).permit(:descripcion,:tipo, :categoria, :material, :cprimario, :csecundario, :user_id)
  end
end