# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alumno do
    nombres "Rita"
    apellidos "Miller"
    sexo "F"
    fec_nac "2014-07-03"
    dni "85413269"
    #sequence(:dni)  { |n| "1234567#{n}" }
    direccion "Tacna"
    apoderado_id 1
  end
end
