class Organizacao <  Atualizavel 
	self.abstract_class = true
	require 'abstract_method'

	abstract_method :adicionar_dono
	abstract_method :dataInicio_nao_pode_ser_no_passado
	abstract_method :dataFim_nao_pode_ser_menor_que_DataInicio
	abstract_method :aceita_atualizador


end
