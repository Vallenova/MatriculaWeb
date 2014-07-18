module ApplicationHelper

	def titulo_completo(titulo_pagina)
		titulo_base = "Sistema de Matrícula"
		if titulo_pagina.empty?
			titulo_base
		else
			"#{titulo_pagina} | #{titulo_base}"
		end
	end
end
