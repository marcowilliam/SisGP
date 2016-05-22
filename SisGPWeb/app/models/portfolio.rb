class Portfolio < Organizacao

	self.table_name = 'portfolios'
	has_many :projetos
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
