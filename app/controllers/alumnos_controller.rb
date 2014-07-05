class AlumnosController < ApplicationController
 def index
  @alumnos = Alumno.all
 end

 def show
  @alumno = Alumno.find params[:id]
 end

 def edit
  @alumno = Alumno.find params[:id]
 end

 def new
  @alumno = Alumno.new
 end

 def create
  @alumno = Alumno.new(alumno_params)
  if @alumno.save
   flash[:success] = "Alumno Creado"
   redirect_to @alumno
  else
   render 'new'
  end
 end
 def update
  @alumno = Alumno.find params[:id]
  if @alumno.update_attributes(alumno_params)
   flash[:success] = "Alumno Actualizado"
   redirect_to @alumno
  else
   render 'edit'
  end
 end

 private

 def alumno_params
  params.require(:alumno).permit(:nombres, :apellidos, :sexo, :dni, :direccion, :fec_nac, :apoderado_id)
 end
end
