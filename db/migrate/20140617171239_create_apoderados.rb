class CreateApoderados < ActiveRecord::Migration
  def change
    create_table :apoderados do |t|
      t.string :nombres
      t.string :apellidos
      t.string :sexo
      t.date :fec_nac
      t.string :dni
      t.string :telefono
      t.string :celular
      t.string :email

      t.timestamps
    end
  end
end
