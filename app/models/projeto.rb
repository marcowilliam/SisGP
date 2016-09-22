class Projeto < Organizacao

	self.table_name = 'projetos'

	has_many :processos, dependent: :nullify
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

  	def adicionar_processos(ids)
	    ids.each do |id|
	      @new_processo = Processo.find(id)
	      if !self.processos.include?(@new_processo)
	        self.processos << @new_processo
	      else
	        #do nothing
	      end 
	    end
  	end

  	def aceita_atualizador(atualizador_organizacao)
    	atualizador_organizacao.template(1, self.id)
  	end

end
