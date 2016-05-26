require 'simplecov'
require 'coveralls'

require "spec_helper"
require "rails_helper"
require "atividade"
require 'usuario'

describe Atividade do
	context "validations" do
		let(:user) {Usuario.create(:nome =>"test", :login=>"123455", :email=>"a@a.com",:password=>"123456", :password_confirmation=>"123456", :telefone=>"123456")}

		before do
			user
		end

		it "should add responsable"
	end
end
