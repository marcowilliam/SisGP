require "spec_helper"
require "rails_helper"
require "usuario"
require "usuarios_controller"

describe UsuariosController do
	describe "POST" do
		it "Create User" do
			@usuario = Usuario.create
			@usuario.should be_an_instance_of Usuario
		end
		it "Save User"
	end

end