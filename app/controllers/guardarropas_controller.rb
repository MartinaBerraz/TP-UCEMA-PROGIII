class GuardarropasController < ApplicationController

  before_action :set_guardarropa, only: [:show, :update, :edit, :destroy]

  #/get/guardarropas/
  def index
    @guardarropas=Guardarropa.all.paginate(page: params[:page], per_page: 5)

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
  end

  def guardarropa_params

    params.require(:guardarropa).permit(:nombre, atuendos_ids:[], prenda_ids:[])
  end
end
