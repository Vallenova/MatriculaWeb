class ApoderadosController < ApplicationController
	helper_method :sort_column, :sort_direction
	
	def index
		#@apoderados = Apoderado.all
		#if params[:search]
		#	@apoderados = Apoderado.search(params[:search])
		#else
		#	@apoderados = Apoderado.all
		#end
		#@apoderados = Apoderado.paginate(:page => params[:page], :per_page => 5)
		@apoderados = Apoderado.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
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

  def sort_column
    Apoderado.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
