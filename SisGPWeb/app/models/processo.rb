class Processo < ActiveRecord::Base
  has_many :atividades
  has_and_belongs_to_many :donos, class_name: 'Usuario'

  validates :nome, presence: true, length: {maximum: 50}
  validates :descricao, presence: true, length: {maximum: 200}
  validades :dataInicio, presence: true
  validades :dataFim, presence: true
  

end
