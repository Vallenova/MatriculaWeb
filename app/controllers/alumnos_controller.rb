class AlumnosController < ApplicationController
 helper_method :sort_column, :sort_direction

 def index
  #@alumnos = Alumno.all
  #@alumnos = Alumno.paginate(:page => params[:page], :per_page => 5)
  @alumnos = Alumno.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
 end

 def show
  @alumno = Alumno.find params[:id]
  @apoderado = @alumno.apoderado
 end

 def edit
  @alumno = Alumno.find params[:id]
  #@apoderados = Apoderado.paginate(:page => params[:page], :per_page => 5)
  obtener_apoderados
 end

 def new
   #@apoderados = Apoderado.paginate(:page => params[:page], :per_page => 5)
   obtener_apoderados
   @alumno = Alumno.new
 end

 def create
  @alumno = Alumno.new(alumno_params)
  if @alumno.save
    flash[:success] = "Alumno Creado"
    redirect_to @alumno
  else
    obtener_apoderados
    render 'new'
  end
 end
 def update
  @alumno = Alumno.find params[:id]
  if @alumno.update_attributes(alumno_params)
   flash[:success] = "Alumno Actualizado"
   redirect_to @alumno
  else
    obtener_apoderados
   render 'edit'
  end
 end

 def obtener_apoderados
   @apoderados = Apoderado.paginate(:page => params[:page], :per_page => 5)
 end

 private

 def alumno_params
  params.require(:alumno).permit(:nombres, :apellidos, :sexo, :dni, :direccion, :fec_nac, :apoderado_id)
 end

 def sort_column
  Alumno.column_names.include?(params[:sort]) ? params[:sort] : "nombres"
 end
  
 def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
 end
 
end
