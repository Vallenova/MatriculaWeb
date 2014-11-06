class CursosController < ApplicationController
	helper_method :sort_column, :sort_direction

	def index
		@cursos = Curso.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
	end
	def new
		@curso = Curso.new
	end
	def create
		@curso = Curso.new(curso_params)
		if @curso.save
			redirect_to @curso
		else
			render 'new'
		end
	end
	def show
		@curso = Curso.find(params[:id])
	end
	def edit
		@curso = Curso.find params[:id]
	end
	def update
		@curso = Curso.find params[:id]
		if @curso.update_attributes curso_params
			redirect_to @curso
		else
			render 'edit'
		end
	end
private

	def curso_params
		params.require(:curso).permit(:nombre, :area)
	end

	def sort_column
		Curso.column_names.include?(params[:sort]) ? params[:sort] : "nombre"
	end
	def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
