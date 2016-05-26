require 'simplecov'
require 'coveralls'

require "spec_helper"
require "rails_helper"
require "usuario"
require "usuarios_controller"

describe UsuariosController, :type => :controller do
	describe "GET user" do
		let(:user) {Usuario.create(:nome =>"test", :login=>"123455", :email=>"a@a.com",:password=>"123456", :password_confirmation=>"123456", :telefone=>"123456")}

		before do
			user
		end

		it "new user" do
			user = Usuario.new
			expect(user).to be_instance_of(Usuario)
		end

		it "create user" do
			user = Usuario.create(:nome =>"test", :login=>"123455", :email=>"a@a.com",:password=>"123456", :password_confirmation=>"123456", :telefone=>"123456")
			expect(user.nome).to eq("test")
		end

	end	
end
