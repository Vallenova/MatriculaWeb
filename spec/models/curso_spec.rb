require 'spec_helper'

describe Curso do
	before {@curso = Curso.new(nombre: "Matematica", area: "Ciencias")}

	subject { @curso}

	it {should respond_to(:nombre)}
	it {should respond_to(:area)}

	it {should be_valid}

	describe "Cuando el nombre no esta presente" do
		before	{@curso.nombre = " "}
		it {should_not be_valid}
	end

	describe "Cuando el area no esta presente" do
		before	{@curso.area = " "}
		it {should_not	be_valid}
	end
end