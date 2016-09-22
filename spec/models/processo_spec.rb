require 'simplecov'
require 'coveralls'
require "processo"
require 'rails_helper'
require 'spec_helper'


describe Processo, :type => :model do
	context "validations" do
		it "requite all datas to create" do
			processo = Processo.new
			expect(processo).to be_instance_of(Processo)
		end
	end
end