require 'spec_helper'

describe 'Paginas de Curso' do
	subject {page}

	describe 'Index' do
		let(:curso) {FactoryGirl.create(:curso)}

		before { visit cursos_path}

		it { should have_title('Cursos')}
		it { should have_content('Cursos')}

		it 'debe listar los cursos' do
			Curso.all.each do |curso|
				expect(page).to have_selector('td', text: curso.nombre)
			end
		end
	end

	describe 'Nuevo' do
		before { visit new_curso_path}
		let(:enviar) {'Crear'}

		describe 'Con información invalida' do
			it 'no deberia crear un curso' do
				expect { click_button enviar}.not_to change(Curso, :count)
			end
		end

		describe 'Con informacion valida' do
			before do
				fill_in "Nombre:", with: "Lenguaje"
				fill_in "Área:", with: "Comunicación"
			end

			it 'deberia crearse un curso' do
				expect { click_button enviar}.to change(Curso,:count)
			end

			describe 'despues de grabar un curso' do
				before {click_button enviar}
				let(:curso) {Curso.find_by(nombre: "Lenguaje")}

				it {should have_selector('div.col-md-4', text: curso.nombre)}
				it {should have_title(titulo_completo("Curso"))}
			end
		end
	end

	describe 'Editar' do
		let(:curso) {FactoryGirl.create(:curso)}
		before {visit edit_curso_path(curso)}

		describe 'Pagina' do
			it {should have_content("Editar Curso")}
      		it {should have_title("Editar Curso")}
		end

		describe 'Con informacion invalida' do
			before {
				fill_in "Nombre:", with: ''
        		fill_in "Área:", with: ''
				click_button 'Guardar'
			}
			it{should have_content('error')}
		end

		describe 'Con informacion valida' do
			let(:nuevo_nombre)  { "Física" }
      		let(:nueva_area) { "Ciencias" }
      		before {
      			fill_in "Nombre:", with: nuevo_nombre
        		fill_in "Área:", with: nueva_area
				click_button 'Guardar'
      		}

      		specify { expect(curso.reload.nombre).to eq nuevo_nombre}
      		specify { expect(curso.reload.area).to eq nueva_area}
		end

	end
end