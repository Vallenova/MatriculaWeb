class ApoderadosController < ApplicationController
	def index
		@apoderados = Apoderado.all
	end
	def show
		@apoderado = Apoderado.find(params[:id])
	end
	def edit
		@apoderado = Apoderado.find params[:id]
	end
	def new
		@apoderado = Apoderado.new
	end
	def create
    	@apoderado = Apoderado.new(apoderado_params)
		if @apoderado.save
		  flash[:success] = "Apoderado Creado"
	      redirect_to @apoderado
	    else
	      render 'new'
	    end
  	end
  	def update
  		@apoderado = Apoderado.find params[:id]
  		if @apoderado.update_attributes(apoderado_params)
  		  flash[:success] = "Apoderado Actualizado"
      	  redirect_to @apoderado
  		else
  		  render 'edit'
  		end
  	end

  	private

    def apoderado_params
      params.require(:apoderado).permit(:nombres, :apellidos, :sexo, :dni, :direccion, :fec_nac, :email, :telefono, :celular)
    end
end
