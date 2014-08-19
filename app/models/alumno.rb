class Alumno < ActiveRecord::Base
	belongs_to :apoderado
	
	VALID_DNI_REGEX = /\d{8}/
	validates :nombres, presence: true
	validates :apellidos, presence: true
	validates :sexo, presence:true
	validates :fec_nac, presence:true
	validates :direccion, presence:true
	validates :dni, presence:true, uniqueness: true,  length: {is: 8}, format: { with: VALID_DNI_REGEX }
	
end
