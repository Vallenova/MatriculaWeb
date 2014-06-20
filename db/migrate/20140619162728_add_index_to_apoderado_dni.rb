class AddIndexToApoderadoDni < ActiveRecord::Migration
  def change
  	add_index :apoderados, :dni, unique: true
  end
end
