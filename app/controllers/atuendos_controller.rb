require "uri"
require "net/http"   #METODOS REQUIRE QUE ME PERMITEN CARGAR Y USAR LAS FUNCIONALIDADES DE LA CLASE NET::HTTP

class AtuendosController < ApplicationController
  before_action :set_guardarropa, except: [:create,:index]
  before_action :set_atuendo, only: [:show, :update, :edit, :destroy]

  #helper_method :sort_column, :sort_direction
  def index
    #if params[:search]
    #  @guardarropa = Guardarropa.find(params[:guardarropa_id])
    #
    # @search_term = Atuendo.etiqueta[(params[:search])]
    # @atuendos= @guardarropa.atuendos.search_by(@search_term)


    #else
    # @guardarropa = Guardarropa.find(params[:guardarropa_id])
    # @atuendos = @guardarropa.atuendos
    #end



    @guardarropa = Guardarropa.find(params[:guardarropa_id])
    @q = @guardarropa.atuendos.ransack(params[:q])
    @atuendos = @q.result(distinct: true).page(params[:page])
    

  end

  def show
  end

  def edit
  end


  def newrandom    #ESTE METODO GENERA EL ATUENDO DEPENDIENDO LA TEMPERATURA QUE MUESTRA LA API WEATHER
    url = URI("http://api.openweathermap.org/data/2.5/weather?q=Buenos%20Aires&units=metric&appid=8ff0f232057223823313bca2059fe178&lang=es")

    http = Net::HTTP.new(url.host, url.port);  #Net::HTTP NOS PERMITE CONSTRUIR HTTP User-agents (COMO LE CORRESPONDE AL CONTROLADOR QUE ES QUIEN INTERACTUA CON LA INFO. PROVENIENTE DEL REQUEST HTTP)
    request = Net::HTTP::Get.new(url)           # https://www.ietf.org/rfc/rfc2616.txt

    response = http.request(request)   #LUEGO DE RECIBIR E INTERPRETAR EL PEDIDO, COMO SABEMOS, EL SERVIDOR RESPONDE CON UN MENSAJE RESPONSE
    temp = JSON.parse(response.read_body)['main']['temp']   #EN TEMP VAMOS A GUARDAR LO QUE NOS INCUMBE EN ESTE CASO: LA TEMPERATURA ACTUAL
    new_atuendo = {
      nombre: 'NUEVO ATUENDO IDEAL PARA ESTE CLIMA!',
      clasificacion: 1,                            #CREAMOS EL NUEVO ATUENDO
      etiqueta: :invierno,
      guardarropa_id: 1,
    }
    @atuendo = @guardarropa.atuendos.create(new_atuendo)       #Y LO GUARDAMOS EN EL CORRESPONDIENTE GUARDARROPA

    tipo = temp.to_i > 10 ? :anteojos : :bufanda           #CON TO_I PASAMOS EL VALOR DE TEMP A ENTERO YA QUE EN EL JSON LO TENEMOS CON COMA,
    #Y PREGUNTAMOS, SI LA TEMPERATURA ES MAYOR A 10 EL ATUENDO LLEVARA UNA PRENDA DE ACCESORIO ANTEOJO SI NO LLEVARA BUFANDA
    new_prendas = [
      {descripcion: 'd1', tipo: tipo, categoria: :accesorio, material: :algodon, cprimario: 'aaa', csecundario: 'bbbb', user_id: 1, created_at: DateTime.now(), updated_at: DateTime.now() },
      {descripcion: 'd2', tipo: :zapatillas, categoria: :calzado, material: :algodon, cprimario: 'aaa2', csecundario: 'bbbb2', user_id: 1, created_at: DateTime.now(), updated_at: DateTime.now() },
      {descripcion: 'd3', tipo: :pantalon, categoria: :inferior, material: :algodon, cprimario: 'aaa3', csecundario: 'bbbb3', user_id: 1, created_at: DateTime.now(), updated_at: DateTime.now() }
    ]
    @prendas = @guardarropa.prendas.insert_all(new_prendas)
    redirect_to guardarropa_atuendo_path(@atuendo.guardarropa_id,@atuendo)    #POR ULTIMO NOS REDIRECCIONA AL RECURSO DEL ATUENDO YA CREADO

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

  #def genera_x_clima

    # @atuendo= Atuendo.create(atuendo_params)
  #end



end

