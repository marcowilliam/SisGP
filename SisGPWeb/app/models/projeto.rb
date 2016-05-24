class Projeto < Organizacao

	self.table_name = 'projetos'

	has_many :processos
	belongs_to :portfolio
	has_and_belongs_to_many :donos, class_name: 'Usuario'

	def adicionar_dono(id)
	    @new_dono = Usuario.find(id)
	    if !self.donos.include?(@new_dono)
	      self.donos << @new_dono
	    else
	      #do nothing
	    end
  	end

end
