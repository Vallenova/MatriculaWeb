require 'spec_helper'

describe AlumnosController do
  before(:each) do
  	@primero = FactoryGirl.create(:alumno, nombres: "Bob", apellidos: "Merly", sexo: "M", fec_nac: "2014-07-03", dni: "44276598", direccion: "Tacna", apoderado_id: 1)
  	@segundo = FactoryGirl.create(:alumno, nombres: "Jimbo", apellidos: "Marly", sexo: "M", fec_nac: "2014-07-03", dni: "44276599", direccion: "Tacna", apoderado_id: 1)
  	@alumnos = [@primero, @segundo]  		
  end

  describe 'ordenar' do

  	it "debe ordenar por nombres y en direccion ascente" do
  		xhr :get, :index, :sort => "nombres" , :direction => "asc"
  		assigns[:alumnos].should == [@primero, @segundo]
  	end

  	it "debe ordenar por nombres y en direccion descendente" do
  		xhr :get, :index, :sort => "nombres" , :direction => "desc"
  		assigns[:alumnos].should == [@segundo, @primero]
  	end
  	it "debe ordenar por apellidos y en direccion ascente" do
  		xhr :get, :index, :sort => "apellidos" , :direction => "asc"
  		assigns[:alumnos].should == [@segundo, @primero]
  	end

  	it "debe ordenar por apellidos y en direccion descendente" do
  		xhr :get, :index, :sort => "apellidos" , :direction => "desc"
  		assigns[:alumnos].should == [@primero, @segundo]
  	end

  end

  describe 'buscar' do
  	
  	it "debe mostrar todas las coincidencias" do
  		xhr :get, :index, :search => "b"
  		assigns[:alumnos].should == [@primero, @segundo]
  	end

  	it "debe encontrar las mas exacta" do
  		xhr :get, :index, :search => "Jimbo"
  		assigns[:alumnos].should == [@segundo]
  	end

  	it "debe ser vacio si no hay coincidencias" do
  		xhr :get, :index, :search => "X"
  		assigns[:alumnos].should == []
  	end

  	it "debe realizar la busqueda respetando el orden seleccionado" do
  		xhr :get, :index, :search => "b", :sort => "nombres" , :direction => "desc"
  		assigns[:alumnos].should == [@segundo, @primero]
  	end

  end

end