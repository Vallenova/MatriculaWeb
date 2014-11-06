require 'spec_helper'

describe CursosController do
  before(:each) do
  	@primero = FactoryGirl.create(:curso, nombre: "Comunicación", area: "Lengua y Literatura")
  	@segundo = FactoryGirl.create(:curso, nombre: "Matemática", area: "Ciencias")
  	@cursos = [@primero, @segundo]  		
  end

  describe 'ordenar' do

  	it "debe ordenar por nombre y en direccion ascente" do
  		xhr :get, :index, :sort => "nombre" , :direction => "asc"
  		assigns[:cursos].should == [@primero, @segundo]
  	end

  	it "debe ordenar por nombre y en direccion descendente" do
  		xhr :get, :index, :sort => "nombre" , :direction => "desc"
  		assigns[:cursos].should == [@segundo, @primero]
  	end
  	it "debe ordenar por area y en direccion ascente" do
  		xhr :get, :index, :sort => "area" , :direction => "asc"
  		assigns[:cursos].should == [@segundo, @primero]
  	end

  	it "debe ordenar por area y en direccion descendente" do
  		xhr :get, :index, :sort => "area" , :direction => "desc"
  		assigns[:cursos].should == [@primero, @segundo]
  	end

  end

  describe 'buscar' do
  	
  	it "debe mostrar todas las coincidencias" do
  		xhr :get, :index, :search => "c"
  		assigns[:cursos].should == [@primero, @segundo]
  	end

  	it "debe encontrar las mas exacta" do
  		xhr :get, :index, :search => "Matemática"
  		assigns[:cursos].should == [@segundo]
  	end

  	it "debe ser vacio si no hay coincidencias" do
  		xhr :get, :index, :search => "X"
  		assigns[:cursos].should == []
  	end

  	it "debe realizar la busqueda respetando el orden seleccionado" do
  		xhr :get, :index, :search => "c", :sort => "nombre" , :direction => "desc"
  		assigns[:cursos].should == [@segundo, @primero]
  	end

  end
end
