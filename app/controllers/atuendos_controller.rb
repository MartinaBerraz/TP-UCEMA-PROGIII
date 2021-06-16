
class AtuendosController < ApplicationController
  before_action :set_guardarropa, except: [:create,:index]
  before_action :set_atuendo, only: [:show, :update, :edit, :destroy]

  helper_method :sort_column, :sort_direction
  def index
    if params[:search]
      @guardarropa = Guardarropa.find(params[:guardarropa_id])

      @search_term = Atuendo.etiqueta[(params[:search])]
      @atuendos= @guardarropa.atuendos.search_by(@search_term)


    else
      @guardarropa = Guardarropa.find(params[:guardarropa_id])
      @atuendos = @guardarropa.atuendos

    end

    @atuendos= @atuendos.order(sort_column+" "+sort_direction).page params[:page]
  end

  def show
  end

  def edit
  end

  def newrandom
    @atuendo = @guardarropa.atuendos.new
    @prendas = @guardarropa.prendas
  end

  def new
    @atuendo = @guardarropa.atuendos.new
    @prendas = @guardarropa.prendas
  end

  def create
    @atuendo= Atuendo.create(atuendo_params)
    redirect_to guardarropa_atuendo_path(@atuendo.guardarropa_id,@atuendo)
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
    params.require(:atuendo).permit(:nombre, :clasificacion, :etiqueta, :guardarropa_id,prenda_ids:[])
  end

  def sort_column
    Atuendo.column_names.include?(params[:sort]) ? params[:sort] : "clasificacion"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

