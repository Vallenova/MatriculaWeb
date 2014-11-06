class Curso < ActiveRecord::Base

	validates :nombre, presence: true
	validates :area, presence: true

	def self.search(query)
		where("nombre like ?", "%#{query}%")
	end
end
