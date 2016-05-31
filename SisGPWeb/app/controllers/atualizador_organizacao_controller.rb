class AtualizadorOrganizacaoController < ApplicationController

	require 'abstract_method'

	abstract_method :template
	abstract_method :visitar_portfolio
	abstract_method :visitar_projeto
	abstract_method :visitar_processo


end
