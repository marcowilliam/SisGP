class Projeto < Organizacao

	self.table_name = 'projetos'

	has_many :processos
	has_many :donos, class_name: 'Usuario'
end
