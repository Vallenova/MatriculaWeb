require 'spec_helper'

describe ApoderadosController do
  before(:each) do
  	@primero = FactoryGirl.create(:apoderado, nombres: "Bob", apellidos: "Merly", sexo: "M", fec_nac: "2014-07-03", dni: "44276598", direccion: "Tacna", telefono: "062319152", celular: "946318265", email: "bob@ejemplo.pe" )
  	@segundo = FactoryGirl.create(:apoderado, nombres: "Jimbo", apellidos: "Marly", sexo: "M", fec_nac: "2014-07-03", dni: "44276599", direccion: "Tacna", telefono: "062319152", celular: "946318265", email: "jimbo@ejemplo.pe")
  	@apoderados = [@primero, @segundo]  		
  end

  describe 'ordenar' do

  	it "debe ordenar por nombres y en direccion ascente" do
  		xhr :get, :index, :sort => "nombres" , :direction => "asc"
  		assigns[:apoderados].should == [@primero, @segundo]
  	end

  	it "debe ordenar por nombres y en direccion descendente" do
  		xhr :get, :index, :sort => "nombres" , :direction => "desc"
  		assigns[:apoderados].should == [@segundo, @primero]
  	end
  	it "debe ordenar por apellidos y en direccion ascente" do
  		xhr :get, :index, :sort => "apellidos" , :direction => "asc"
  		assigns[:apoderados].should == [@segundo, @primero]
  	end

  	it "debe ordenar por apellidos y en direccion descendente" do
  		xhr :get, :index, :sort => "apellidos" , :direction => "desc"
  		assigns[:apoderados].should == [@primero, @segundo]
  	end

  end

  describe 'buscar' do
  	
  	it "debe mostrar todas las coincidencias" do
  		xhr :get, :index, :search => "b"
  		assigns[:apoderados].should == [@primero, @segundo]
  	end

  	it "debe encontrar las mas exacta" do
  		xhr :get, :index, :search => "Jimbo"
  		assigns[:apoderados].should == [@segundo]
  	end

  	it "debe ser vacio si no hay coincidencias" do
  		xhr :get, :index, :search => "X"
  		assigns[:apoderados].should == []
  	end

  	it "debe realizar la busqueda respetando el orden seleccionado" do
  		xhr :get, :index, :search => "b", :sort => "nombres" , :direction => "desc"
  		assigns[:apoderados].should == [@segundo, @primero]
  	end

  end

end