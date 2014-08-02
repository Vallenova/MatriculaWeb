require 'spec_helper'

describe Alumno do
  #pending "add some examples to (or delete) #{__FILE__}"
  before {@alumno = Alumno.new(nombres: "Ronald", 
  	apellidos: "Gomez", 
  	sexo: "M",
  	fec_nac: "2014-06-17",
  	dni: "00546235",
  	direccion: "Tacna, Perú"
  	)}

  subject { @alumno}

  it {should respond_to(:nombres)}
  it {should respond_to(:apellidos)}
  it {should respond_to(:sexo)}
  it {should respond_to(:fec_nac)}
  it {should respond_to(:dni)}
  it {should respond_to(:direccion)}

  it {should be_valid}

  describe "Cuando los nombres no estan presentes" do
  	before {@alumno.nombres = " "}
  	it {should_not be_valid}
  end

  describe "Cuando los apellidos no estan presentes" do
    before { @alumno.apellidos = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el sexo no esta presente" do
  	before { @alumno.sexo = " "}
  	it {should_not be_valid}
  end

  describe "Cuando la fecha de nacimiento no esta presente" do
  	before { @alumno.fec_nac = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el documento de identidad no esta presente" do
  	before { @alumno.dni = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el tamaño del documento de identidad es invalido" do
    it "debe ser invalido" do
      dnis = %w[123456789 123456 00]
      dnis.each do |dni_invalido|
        @alumno.dni = dni_invalido
        expect(@alumno).not_to be_valid
      end
    end
  end

  describe "Cuando el tamaño del documento de identidad es valido" do
    it "debe ser valido" do
      dnis = %w[44278156 45653201]
      dnis.each do |dni_valido|
        @alumno.dni = dni_valido
        expect(@alumno).to be_valid
      end
    end
  end

  describe "Cuando el formato del documento de indentidad es invalido" do
    it "debe ser invalido" do
      dnis = %w[123qwe78 *.897452]
      dnis.each do |dni_invalido|
        @alumno.dni = dni_invalido
        expect(@alumno).not_to be_valid
      end
    end
  end

  describe "Cuando el formato del documento de identidad es valido" do
    it "debe ser valido" do
      dnis = %w[44278156 45653201]
      dnis.each do |dni_valido|
        @alumno.dni = dni_valido
        expect(@alumno).to be_valid
      end
    end
  end

  describe "Cuando el dni ya ha sido utilizado" do
    before do
      apoderado_con_algun_dni = @alumno.dup
      apoderado_con_algun_dni.dni = @alumno.dni
      apoderado_con_algun_dni.save
    end

    it {should_not be_valid}
  end

  describe "Cuando la direccion no esta presente" do
    before { @alumno.direccion = " "}
    it {should_not be_valid}
  end
end
