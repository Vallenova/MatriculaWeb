class CreateAlumnos < ActiveRecord::Migration
  def change
    create_table :alumnos do |t|
      t.string :nombres
      t.string :apellidos
      t.string :sexo
      t.date :fec_nac
      t.string :dni
      t.string :direccion
      t.integer :apoderado_id

      t.timestamps
    end
    add_index :alumnos, [:apoderado_id]
  end
end
