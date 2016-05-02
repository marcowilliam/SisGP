class Projeto < ActiveRecord::Base
	has_many :processos
	has_many :donos, class_name: 'Usuario'
end
