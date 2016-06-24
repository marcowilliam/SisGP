class Atividade < ActiveRecord::Base
  belongs_to :processo
  has_many :comentarios
  has_and_belongs_to_many :responsaveis, class_name: 'Usuario'

  def adicionar_responsavel(id)
  	@user_to_be_added = Usuario.find(id)
  	if !self.responsaveis.include?(@user_to_be_added)
      self.responsaveis.destroy_all
  		self.responsaveis << @user_to_be_added
  	else
  		#do nothing
  	end
  end

end
