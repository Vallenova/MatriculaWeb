require 'spec_helper'

describe "Página Contenedor" do
  describe "Crear Apoderado" do
    it "deberia tener el contenido 'Tacna-Perú'" do
      visit root_path
      expect(page).to have_content('Tacna-Perú')
      expect(page).to have_content('Asistente')
    end

    it "deberia tener el título 'Crear Apoderado'" do
      visit root_path
      expect(page).to have_title(titulo_completo(""))
    end
  end
end
