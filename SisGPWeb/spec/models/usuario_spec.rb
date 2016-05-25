require "spec_helper"
require "rails_helper"
require "usuario"

describe Usuario do
	context "validations" do
		
		it "requite all datas to create" do
			usuario = Usuario.create
			usuario.nome = "Test"
			usuario.login = "123456"
			usuario.telefone = "555"
			usuario.password_digest = "123"
			usuario.email = "a@a.com"
			expect(usuario).to be_valid
		end

		it "requite right email"

		it "requite right login size"

		it "requite password to be set"

	end
end
