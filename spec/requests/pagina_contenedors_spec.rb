require 'spec_helper'

describe "Página Contenedor" do
  it "deberia tener el contenido 'Tacna-Perú'" do
    visit '/pagina_contenedor/home'
    expect(page).to have_content('Tacna-Perú')
  end
end
