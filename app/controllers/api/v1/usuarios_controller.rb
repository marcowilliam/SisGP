class Api::V1::UsuariosController < ApplicationController
  respond_to :json

  def index
    @users = Usuario.all
    respond_with @users, status: :ok
  end


end
