require 'simplecov'
require 'coveralls'

require "spec_helper"
require "rails_helper"
require "usuario"
require "usuarios_controller"

describe UsuariosController do
	describe "POST" do
		it "New User" do
			@usuario = Usuario.new
			@usuario.should be_an_instance_of Usuario
		end

	end

end