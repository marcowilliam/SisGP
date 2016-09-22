require 'simplecov'
require 'coveralls'

require "spec_helper"
require "rails_helper"
require "atividade"
require 'usuario'

describe Atividade do
	subject(:atividade) { Atividade.new(nome: "teste", descricao: "teste01", dataInicio: nil, dataFim: nil)}
	context "validations" do
		let(:user) {Usuario.create(:nome =>"test", :login=>"123455", :email=>"a@a.com",:password=>"123456", :password_confirmation=>"123456", :telefone=>"123456")}

		it "should add responsable" do
			atividade.adicionar_responsavel(user.id)
			expect((atividade.responsaveis[1])).to equal(nil)
		end
	end
end
