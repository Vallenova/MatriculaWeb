require 'spec_helper'

describe "Páginas Apoderado" do

  subject { page }

  describe "Página registro apoderado" do
    before { visit new_apoderado_path }

    it { should have_content('Crear Apoderado') }
    it { should have_title(titulo_completo('Crear Apoderado')) }
  end

  describe "registro" do
  	before { visit new_apoderado_path }

  	let(:enviar) { "Crear" }

  	describe "con información invalida" do
  		it "no debería crear un apoderado" do
  			expect { click_button enviar }.not_to change(Apoderado, :count)
  		end
  	end

  	describe "con información válida" do
  		before do
  			fill_in "Nombres:", with: "Sin Nombres"
        fill_in "Apellidos:", with: "Sin Apellidos"
        fill_in "Documento de Identidad:", with: "21345647"
        fill_in "Correo electrónico:", with: "usuario@ejemplo.pe"
        fill_in "Celular:", with: "952010101"
        fill_in "Dirección:", with: "Av. Principal S/N"
        fill_in "Fecha de Nacimiento", with: "01/02/1980"
        fill_in "Teléfono(Opcional):", with: "052310101"
        choose "Masculino"
  		end

  		it "debería crearse un apoderado" do
  			expect { click_button enviar }.to change(Apoderado, :count).by(1)
  		end

      describe "despues de grabar un apoderado" do
        before { click_button enviar }
        let(:apoderado) { Apoderado.find_by(email: "usuario@ejemplo.pe")}

        it { should have_selector('div.col-md-4', text: apoderado.nombres) }
        it { should have_title(titulo_completo("Apoderado")) }
        it { should have_link("crear usuario") }
      end
  	end
  end
end
