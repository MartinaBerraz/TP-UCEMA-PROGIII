class GuardarropasController < ApplicationController

  before_action :set_guardarropa, only: [:show, :update, :edit, :destroy]

  #/get/guardarropas/
  def index
    @guardarropas = Guardarropa.all
  end

  # get /guardarropas/:id
  def show
  end

  def create
    Guardarropa.create! guardarropa_params # nota: guardarropa_params NO viene con el controller,
    redirect_to action: :index
  end
  def destroy
    @guardarropa.destroy!
    redirect_to :action => :index
  end


  private

  def set_guardarropa
    @guardarropa = Guardarropa.find(params[:id])
  end

  def guardarropa_params
    # esto vamos a hacerlo siempre así, como una receta,
    # que nos provee rails para manejar de forma segura los campos de un
    # formulario. El require va a llevar el nombre de la clase que queremos manipular
    # y el permit, los campos particulares que nos interesa admitir para editar/crear.
    params.require(:pguardarropa).permit(:nombre)
  end
end
