module ApplicationHelper

	def titulo_completo(titulo_pagina)
		titulo_base = "Sistema de Matrícula"
		if titulo_pagina.empty?
			titulo_base
		else
			"#{titulo_pagina} | #{titulo_base}"
		end
	end

	def sortable(column, title = nil)
	  title ||= column.titleize
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
	end
end
