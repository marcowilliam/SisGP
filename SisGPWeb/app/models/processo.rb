class Processo < ActiveRecord::Base
  has_many :atividades
  has_and_belongs_to_many :donos, class_name: 'Usuario'

  validates :nome, presence:{message: "Não pode ser nulo"}, length: {minimum: 6, message: "Menor que esperado"} 
  validates :descricao, presence: {message: "Não pode ser nula"}, length: {maximum: 200, message: "Descricao muito grande"}
  validates :dataInicio, presence: true
  validates :dataFim, presence: {message: "Campo em Branco ou inválido! EX: 05-02-2015"}
  validate :dataInicio_cannot_be_in_the_past
  validate :dataFim_cannot_be_less_than_dataInicio



  def dataInicio_cannot_be_in_the_past
  	errors.add(:dataInicio, "A data de inicio não pode ser menor que hoje") if
  		dataInicio<Date.today
  end


  def dataFim_cannot_be_less_than_dataInicio
  	errors.add(:dataFim, "A data de fim está antes da data de inicio") if
  		dataFim<dataInicio
  	end

  def add_dono(id)
    @new_dono = Usuario.find(id)
    if !self.donos.include?(@new_dono)
      self.donos << @new_dono
    else
      #do nothing
    end
  end

end
