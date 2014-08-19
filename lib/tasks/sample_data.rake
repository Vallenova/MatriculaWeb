namespace :db do
  desc "Llena la base de datos con datos de ejemplo"
  task populate: :environment do
    #Apoderado.create!(nombres: "Marco", apellidos: "Vargas", dni: "44112255", email: "avargas@gmail.com", celular: "952303164", direccion: "Tacna", fec_nac: "2014-07-03", sexo: "M", telefono: "052303164")
    99.times do |n|
      nombres  = Faker::Name.first_name
      apellidos  = Faker::Name.last_name
      dni = Faker::Number.number(8)
      email = Faker::Internet.email
      celular = Faker::Number.number(9)
      direccion = Faker::Address.street_address
      fec_nac = "2014-07-03"
      sexo = "M"
      telefono  = Faker::Number.number(9)
      Apoderado.create!(nombres: nombres, apellidos: apellidos, dni: dni, email: email, celular: celular, direccion: direccion, fec_nac: fec_nac, sexo: sexo, telefono: telefono)
    end
      

    # Alumno.create!(nombres: "Marco", apellidos: "Vargas", dni: "44112255", direccion: "Tacna", fec_nac: "2014-07-03", sexo: "M", apoderado_id: 1)
    99.times do |n|
      nombres  = Faker::Name.first_name
      apellidos  = Faker::Name.last_name
      dni = Faker::Number.number(8)
      direccion = Faker::Address.street_address
      fec_nac = "2014-07-03"
      sexo = "M"
      apoderado_id  = 1
      Alumno.create!(nombres: nombres, apellidos: apellidos, dni: dni, direccion: direccion, fec_nac: fec_nac, sexo: sexo, apoderado_id: apoderado_id)
    end
  end
end