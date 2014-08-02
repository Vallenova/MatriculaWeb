require 'spec_helper'

describe Apoderado do

  let(:usuario) { FactoryGirl.create(:usuario) }

  before do
    @apoderado = Apoderado.new( nombres: "Ronald",
      apellidos: "Gomez",
      sexo: "M",
      fec_nac: "2014-06-17",
      dni:"00256314",
      telefono:"054698532",
      celular:"954847562",
      email:"ronald.gomez@vallenova.pe",
      direccion:"Tacna, Perú" )
    @apoderado.usuario = usuario
  end

  subject { @apoderado}

  it {should respond_to(:nombres)}
  it {should respond_to(:apellidos)}
  it {should respond_to(:sexo)}
  it {should respond_to(:fec_nac)}
  it {should respond_to(:dni)}
  it {should respond_to(:telefono)}
  it {should respond_to(:celular)}
  it {should respond_to(:email)}
  it {should respond_to(:direccion)}
  it {should respond_to(:usuario_id)}
  it {should respond_to(:usuario)}
  its(:usuario) { should eq usuario }

  it {should be_valid}

  describe "Cuando los nombres no estan presentes" do
  	before { @apoderado.nombres = " "}
  	it {should_not be_valid}
  end

  describe "Cuando los apellidos no estan presentes" do
  	before { @apoderado.apellidos = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el sexo no esta presente" do
  	before { @apoderado.sexo = " "}
  	it {should_not be_valid}
  end

  describe "Cuando la fecha de nacimiento no esta presente" do
  	before { @apoderado.fec_nac = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el documento de identidad no esta presente" do
  	before { @apoderado.dni = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el tamaño del documento de identidad es invalido" do
    it "debe ser invalido" do
      dnis = %w[123456789 123456 00]
      dnis.each do |dni_invalido|
        @apoderado.dni = dni_invalido
        expect(@apoderado).not_to be_valid
      end
    end
  end

  describe "Cuando el tamaño del documento de identidad es valido" do
    it "debe ser valido" do
      dnis = %w[44278156 45653201]
      dnis.each do |dni_valido|
        @apoderado.dni = dni_valido
        expect(@apoderado).to be_valid
      end
    end
  end

  describe "Cuando el formato del documento de indentidad es invalido" do
    it "debe ser invalido" do
      dnis = %w[123qwe78 *.897452]
      dnis.each do |dni_invalido|
        @apoderado.dni = dni_invalido
        expect(@apoderado).not_to be_valid
      end
    end
  end

  describe "Cuando el formato del documento de identidad es valido" do
    it "debe ser valido" do
      dnis = %w[44278156 45653201]
      dnis.each do |dni_valido|
        @apoderado.dni = dni_valido
        expect(@apoderado).to be_valid
      end
    end
  end

  describe "Cuando el dni ya ha sido utilizado" do
    before do
      apoderado_con_algun_dni = @apoderado.dup
      apoderado_con_algun_dni.dni = @apoderado.dni
      apoderado_con_algun_dni.save
    end

    it {should_not be_valid}
  end

  describe "Cuando el numero de celular no esta presente" do
  	before { @apoderado.celular = " "}
  	it {should_not be_valid}
  end

  describe "Cuando el formato del numero de celular es invalido" do
    it "debe ser invalido" do
      celulares = %w[uuuu56789 ..as45896]
      celulares.each do |celular_invalido|
        @apoderado.celular = celular_invalido
        expect(@apoderado).not_to be_valid
      end
    end
  end

  describe "Cuando el formato del numero de celular es valido" do
    it "debe ser valido" do
      celulares = %w[952303146 956823146]
      celulares.each do |celular_valido|
        @apoderado.celular = celular_valido
        expect(@apoderado).to be_valid
      end
    end
  end

  describe "Cuando el formato de email es invalido" do
  	it "debe ser invalido" do
  	  emails = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      emails.each do |email_invalido|
        @apoderado.email = email_invalido
        expect(@apoderado).not_to be_valid
      end
  	end
  end

  describe "Cuando el formato de email es valido" do
    it "debe ser valido" do
      emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      emails.each do |email_valido|
      	@apoderado.email = email_valido
      	expect(@apoderado).to be_valid
      end
    end
  end

  describe "Cuando el formato del numero de telefono es invalido" do
    it "debe ser invalido" do
      telefonos = %w[asd568541 .f.475861]
      telefonos.each do |telefono_invalido|
        @apoderado.telefono = telefono_invalido
        expect(@apoderado).not_to be_valid
      end
    end
  end

  describe "Cuando el formato del numero de telefono es valido" do
    it "debe ser valido" do
      telefonos = %w[052318812 052869532]
      telefonos.each do |telefono_valido|
        @apoderado.telefono = telefono_valido
        expect(@apoderado).to be_valid
      end
    end
  end

  describe "Cuando la direccion no esta presente" do
    before { @apoderado.direccion = " "}
    it {should_not be_valid}
  end
  #describe "Registro Apoderado" do
  #  before {visit registro_apoderado_path}
  #  let(:submit) {"Guardar"}
  #end
end
