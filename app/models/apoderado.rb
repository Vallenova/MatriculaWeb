class Apoderado < ActiveRecord::Base
	has_many :alumno

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_DNI_REGEX = /\d{8}/
	VALID_TEL_REGEX = /\d{9}/

	validates :nombres, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }
	validates :apellidos, presence: true
	validates :sexo, presence:true
	validates :fec_nac, presence:true
	validates :direccion, presence:true
	validates :dni, presence:true, uniqueness: true,  length: {is: 8}, format: { with: VALID_DNI_REGEX }
	validates :celular, presence:true, format: { with: VALID_TEL_REGEX }
	validates :telefono, format: { with: VALID_TEL_REGEX }

	def self.search(query)
	  where("nombres like ?", "%#{query}%")
	end

	#def self.search(id)
	#  where("id like ?", "%#{id}%")
	#end
end
