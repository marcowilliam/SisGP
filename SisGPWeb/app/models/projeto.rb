class Projeto < Organizacao

	self.table_name = 'projetos'

	has_many :processos
	has_one :portfolio
	has_many :donos, class_name: 'Usuario'

	def adicionar_dono(id)
	    @new_dono = Usuario.find(id)
	    if !self.donos.include?(@new_dono)
	      self.donos << @new_dono
	    else
	      #do nothing
	    end
  	end

end
