class UsuarioController < ApplicationController
  def new
	  @user = User.new
  end
  def create
	  @user = User.new(user_params)
	  if @user.save
		  redirect_to @user, notice: "Usuário foi criado com sucesso!"
		  sign_in(@user)
	  else
		  render action: :new
	  end
  end
  private
  def user_params
	  params.require(:user).permit(:nome,:email,:password, :password_confirmation, :login, :telefone)
  end

end
