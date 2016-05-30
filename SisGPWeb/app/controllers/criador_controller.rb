class CriadorController < ApplicationController
	
	require 'abstract_method'

	abstract_method :new
	abstract_method :create

end
