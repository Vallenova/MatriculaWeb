# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :apoderado do
    nombres "Ronald Pedro"
    apellidos "Gomez Asqui"
    sexo "M"
    fec_nac "2014-06-17"
    dni "44556699"
    telefono "062319152"
    celular "946318265"
    email "ronald.gomez@ejemplo.pe"
  end
end
