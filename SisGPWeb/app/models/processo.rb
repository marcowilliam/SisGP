class Processo < Organizacao 
  
  self.table_name = 'processos'
  has_many :atividades
  belongs_to :projeto
  has_and_belongs_to_many :donos, class_name: 'Usuario'

  validates :nome, presence:{message: "Não pode ser nulo"}, length: {minimum: 6, message: "Menor que esperado"} 
  validates :descricao, presence: {message: "Não pode ser nula"}, length: {maximum: 200, message: "Descricao muito grande"}
  validates :dataInicio, presence: true
  validates :dataFim, presence: {message: "Campo em Branco ou inválido! EX: 05-02-2015"}
  validate :dataInicio_nao_pode_ser_no_passado
  validate :dataFim_nao_pode_ser_menor_que_DataInicio



  def dataInicio_nao_pode_ser_no_passado
  	errors.add(:dataInicio, "A data de inicio não pode ser menor que hoje") if
      Date.today > dataInicio
  end


  def dataFim_nao_pode_ser_menor_que_DataInicio
  	errors.add(:dataFim, "A data de fim está antes da data de inicio") if
  		dataFim<dataInicio
  end

  def adicionar_dono(id)
    @new_dono = Usuario.find(id)
    if !self.donos.include?(@new_dono)
      self.donos << @new_dono
    else
      #do nothing
    end
  end

  def aceita_atualizador(atualizador_organizacao)
    atualizador_organizacao.template(0, self.id)
  end

end
