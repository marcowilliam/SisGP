class Atualizavel < ActiveRecord::Base
	self.abstract_class = true
	require 'abstract_method'
	
	abstract_method :aceita_atualizador
end
