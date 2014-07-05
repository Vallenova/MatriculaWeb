class AddIndexToAlumnoDni < ActiveRecord::Migration
  def change
  	add_index :alumnos, :dni, unique: true
  end
end
