class UsuarioController < ApplicationController
  def new
	  @usuario = Usuario.new
  end
  def create
	  @usuario = Usuario.new(usuario_params)
	  if @usuario.save
		  redirect_to @usuario, notice: "Usuário foi criado com sucesso!"
		  sign_in(@usuario)
	  else
		  render action: :new
	  end
  end
  private
  def ususuario_params
	  params.require(:usuario).permit(:nome,:email,:password, :password_confirmation, :login, :telefone)
  end

end
