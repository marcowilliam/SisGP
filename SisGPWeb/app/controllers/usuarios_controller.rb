class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :block_access, except: [:destroy, :show, :edit]

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

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  def edit
  end

  private

  def set_usuario
      @usuario = Usuario.find(params[:id])
    end

  def usuario_params
	  params.require(:usuario).permit(:nome,:email,:password, :password_confirmation, :login, :telefone)
  end

end
