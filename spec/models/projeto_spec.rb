require 'simplecov'
require 'coveralls'

require "spec_helper"
require "rails_helper"
require "projeto"
require 'usuario'

describe Projeto do
	subject(:projeto) { Projeto.new(nome: "teste", descricao: "teste01", dataInicio: nil, dataFim: nil)}
	context "validations" do
		let(:user) {Usuario.create(:nome =>"test", :login=>"123455", :email=>"a@a.com",:password=>"123456", :password_confirmation=>"123456", :telefone=>"123456")}

		it "should add responsable" do
			projeto.adicionar_dono(user.id)
			expect((projeto.donos[1])).to equal(nil)
		end
	end
end
