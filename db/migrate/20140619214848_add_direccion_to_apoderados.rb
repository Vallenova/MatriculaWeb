class AddDireccionToApoderados < ActiveRecord::Migration
  def change
    add_column :apoderados, :direccion, :string
  end
end
