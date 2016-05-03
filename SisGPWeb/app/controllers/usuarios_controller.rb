class UsuariosController < ApplicationController
  before_action :block_access, except: [:destroy]
  def new
	  @usuario = Usuario.new
  end
  def create
	  @usuario = Usuario.new(usuario_params)
	  if @usuario.save
	  	  sign_in @usuario
		  redirect_to root_path, notice: "Usuário foi criado com sucesso!"
	  else
		  render action: :new
	  end
  end
  private
  def usuario_params
	  params.require(:usuario).permit(:nome,:email,:password, :password_confirmation, :login, :telefone)
  end

end
