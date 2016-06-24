class Comentario < ActiveRecord::Base
	belongs_to :atividade
	belongs_to :usuario

end
