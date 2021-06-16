class GuardarropasController < ApplicationController

  before_action :set_guardarropa, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!
  #/get/guardarropas/
  def index

    @guardarropas=Guardarropa.where(user: current_user).page params[:page]
    @prendas=Prenda.where(user: current_user).page params[:page]

  end

  # get /guardarropas/:id
  def show

  end

  def edit
  end


  # get /guaradrropas/new
  def new
    @guardarropa = Guardarropa.new
    @prendas = Prenda.all
  end

  def create
    Guardarropa.create! guardarropa_params # nota: guardarropa_params NO viene con el controller,
    redirect_to action: :index
  end
  def destroy
    @guardarropa.destroy!
    redirect_to :action => :index
  end


  def update
    @guardarropa.update! guardarropa_params
    redirect_to @guardarropa
  end

  private

  def set_guardarropa
    @guardarropa = Guardarropa.find(params[:id])
    @atuendos = Atuendo.find_by(guardarropa_id: @guardarropa.id)
  end

  def guardarropa_params

    params.require(:guardarropa).permit(:nombre, :user_id, atuendos_ids:[],prenda_ids:[])
  end


end
