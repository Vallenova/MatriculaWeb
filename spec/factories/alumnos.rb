# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alumno do
    nombres "MyString"
    apellidos "MyString"
    sexo "MyString"
    fec_nac "2014-07-03"
    dni "MyString"
    direccion "MyString"
    apoderado_id 1
  end
end
