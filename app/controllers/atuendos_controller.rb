class AtuendosController < ApplicationController
  before_action :set_atuendo, only: [:show, :update, :edit, :destroy]

  #/get/atuendos/
  def index
    @atuendo = Atuendo.all
  end

  # get /atuendos/:id
  def show
  end

  def edit
  end


  # get /atuendos/new
  def new
    @atuendo = Atuendo.new
    @prendas = Prenda.all
  end

  def create
    Atuendo.create! atuendo_params # nota: atuendo_params NO viene con el controller,
    redirect_to action: :index
  end
  def destroy
    @atuendo.destroy!
    redirect_to :action => :index
  end


  def update
    @atuendo.update! atuendo_params
    redirect_to @atuendo
  end

  private

  def set_atuendo
    @atuendo = Atuendo.find(params[:id])
  end

  def atuendo_params
    # esto vamos a hacerlo siempre así, como una receta,
    # que nos provee rails para manejar de forma segura los campos de un
    # formulario. El require va a llevar el nombre de la clase que queremos manipular
    # y el permit, los campos particulares que nos interesa admitir para editar/crear.
    params.require(:atuendo).permit(:nombre, prenda_ids:[])
  end
end

