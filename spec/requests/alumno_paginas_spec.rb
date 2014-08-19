require 'spec_helper'

describe 'Paginas de Alumno' do
  subject {page}

  describe 'index' do
	let(:alumno) {FactoryGirl.create(:alumno)}

	before { visit alumnos_path}

	it { should have_title('Alumnos')}
	it { should have_content('Alumnos')}

	it 'deberia listar cada alumno' do
	  Alumno.all.each do |alumno|
	  	expect(page).to have_selector('li', text: alumno.nombres)
	  end
	end
  end

  describe 'Nuevo' do
	before {visit nuevo_alumno_path}
	it { should have_content('Crear Alumno')}
	it { should have_title(titulo_completo('Crear Alumno'))}

	describe 'Crear alumno' do
	  let(:submit) {'Crear'}

	  describe 'Con informacion invalida' do
	    it 'no debe crear un alumno' do
	      expect { click_button submit }.not_to change(Alumno, :count)
	    end
	  end

	  describe 'Con informacion valida' do

	    before do
	      fill_in "Nombres:", with: "Rita"
		  fill_in "Apellidos:", with:"Miller"
		  fill_in "Fecha de Nacimiento:", with: "2014-07-03"
		  fill_in "Documento de Identidad:", with: "85413269"
		  fill_in "Dirección:", with: "Tacna"

		  choose "Femenino"

		  hidden_field = find :xpath, "//input[@id='alumno_apoderado_id']"
		  hidden_field.set "1"
		end

		it "debe crear un alumno" do
		  expect { click_button submit }.to change(Alumno, :count).by(1)
		end
	  end
    end
  end                                        
end