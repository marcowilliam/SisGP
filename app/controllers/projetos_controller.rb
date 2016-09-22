class ProjetosController < ApplicationController
  before_action :set_projeto, only: [:show, :edit, :update, :destroy]
  before_action :block_organization_access

  # GET /projetos
  # GET /projetos.json
  def index
    @projetos = current_user.projetos
  end

  # GET /projetos/1
  # GET /projetos/1.json
  def show
  end

  # GET /projetos/new
  def new
    @projeto = Projeto.new
    @processos = current_user.processos
    @processos = @processos.where(:projeto => nil)
  end

  # GET /projetos/1/edit
  def edit
    @processos = current_user.processos
    @processos = @processos.where(:projeto => nil)
  end

  # POST /projetos
  # POST /projetos.json
  def create
    @projeto = Projeto.new(projeto_params)
    @projeto.adicionar_dono current_user.id
    @processos_added = params[:processos_added]
    if @processos_added
      @projeto.adicionar_processos @processos_added
    else
      #do nothing
    end

    respond_to do |format|
      if @projeto.save
        format.html { redirect_to '/projetos', notice: 'Projeto ' + @projeto.nome + ' criado com sucesso.' }
        format.json { render :show, status: :created, location: @projeto }
      else
        format.html { render :new }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projetos/1
  # PATCH/PUT /projetos/1.json
  def update
    @processos_added = params[:processos_added]
    if @processos_added
      @projeto.adicionar_processos @processos_added
    else
      #do nothing
    end
    
    dono_to_be_added_email = params[:dono]
    @dono_to_be_added = Usuario.where(:email => dono_to_be_added_email).first
    if @dono_to_be_added
      @projeto.adicionar_dono (@dono_to_be_added.id)
    else
      #do nothing
    end

    respond_to do |format|
      if @projeto.update(projeto_params)
        format.html { redirect_to '/projetos', notice: 'Projeto ' + @projeto.nome + ' atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @projeto }
      else
        format.html { render :edit }
        format.json { render json: @projeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projetos/1
  # DELETE /projetos/1.json
  def destroy
    @projeto.destroy
    respond_to do |format|
      format.html { redirect_to projetos_url, notice: 'Projeto ' + @projeto.nome + ' deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projeto
      @projeto = Projeto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projeto_params
      params.require(:projeto).permit(:nome, :descricao, :dataInicio, :dataFim, :processos)
      #params.fetch(:projeto, {})
    end
end
