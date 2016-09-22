class Portfolio < Organizacao

	self.table_name = 'portfolios'
	has_many :projetos, dependent: :nullify
	has_and_belongs_to_many :donos, class_name: 'Usuario'

	def adicionar_dono(id)
    @new_dono = Usuario.find(id)
    if !self.donos.include?(@new_dono)
      self.donos << @new_dono
    else
      #do nothing
    end
  end

  def adicionar_projeto(ids)
    ids.each do |id|
      @new_projeto = Projeto.find(id)
      if !self.projetos.include?(@new_projeto)
        self.projetos << @new_projeto
      else
        #do nothing
      end 
    end
  end

  def aceita_atualizador(atualizador_organizacao)
    atualizador_organizacao.template(2, self.id)
  end

end
