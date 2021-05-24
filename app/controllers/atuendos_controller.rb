class AtuendosController < ApplicationController
  before_action :set_guardarropa, except: [:create]
  before_action :set_atuendo, only: [:show, :update, :edit, :destroy]

  def index
    @guardarropa = Guardarropa.find(params[:guardarropa_id])
    @atuendos = @guardarropa.atuendos
  end

  def show
  end

  def edit
  end

  def new
    @atuendo = @guardarropa.atuendos.new
    @prendas = @guardarropa.prendas
  end

  def create
    @atuendo= Atuendo.create(atuendo_params)
    redirect_to controller: 'guardarropas', action: 'show', id:@atuendo.guardarropa_id
  end
  def destroy
    @atuendo.destroy!
    redirect_to :action => :index
  end


  def update
    @atuendo.update! guardarropa_params
    redirect_to @atuendo
  end

  private

  def set_atuendo
    @atuendo = @guardarropa.atuendos.find(params[:id])
  end

  def set_guardarropa
    @guardarropa= Guardarropa.find(params[:guardarropa_id])
  end

  def atuendo_params
    params.require(:atuendo).permit(:nombre, :guardarropa_id,prenda_ids:[])
  end



end
