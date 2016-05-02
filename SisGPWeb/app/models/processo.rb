class Processo < ActiveRecord::Base
  has_many :atividades
  belongs_to :owner, class_name: 'Usuario'

end
