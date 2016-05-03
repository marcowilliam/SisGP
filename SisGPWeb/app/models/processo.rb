class Processo < ActiveRecord::Base
  has_many :atividades
  has_and_belongs_to_many :donos, class_name: 'Usuario'

end
