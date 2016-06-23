class ProcessosController < ApplicationController
  before_action :set_processo, only: [:show, :edit, :update, :destroy]
  before_action :block_organization_access

  # GET /processos
  # GET /processos.json
  def index
    @processos = Array.new
    current_user.processos.each do |processo|
      @processos << processo
    end
    Processo.all.each do |processo|
      processo.atividades.each do |atividade|
        if((atividade.responsaveis.include?(current_user)) && (!@processos.include?(processo)))
          @processos << processo
        end
      end
    end
  end

  # GET /processos/1
  # GET /processos/1.json
  def show
  end

  # GET /processos/new
  def new
    @processo = Processo.new
  end

  # GET /processos/1/edit
  def edit
  end

  # POST /processos
  # POST /processos.json
  def create
    @processo = Processo.new(processo_params)
    @processo.adicionar_dono current_user.id
    @projeto_to_be_added = params[:projeto]
    respond_to do |format|
      if @processo.save
        format.html { redirect_to root_path, notice: 'Processo '+ @processo.nome + ' criado com sucesso' }
        format.json { render :show, status: :created, location: @processo }
      else
        format.html { render :new }
        format.json { render json: @processo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processos/1
  # PATCH/PUT /processos/1.json
  def update
    respond_to do |format|
      dono_to_be_added_email = params[:dono]
      @dono_to_be_added = Usuario.where(:email => dono_to_be_added_email).first
      if @dono_to_be_added
        @processo.adicionar_dono (@dono_to_be_added.id)
      end
      if @processo.update(processo_params)
        format.html { redirect_to '/processos', notice: 'Processo '+ @processo.nome + 
          ' atualizidado com sucesso.' }
        format.json { render :show, status: :ok, location: @processo }
      else
        format.html { render :edit }
        format.json { render json: @processo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processos/1
  # DELETE /processos/1.json
  def destroy
    #deleting all atividades related to the process befor deleting it
    @processo.atividades.destroy_all
    @processo.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Processo '+ @processo.nome + 
          ' deletado com sucesso.'}
      format.json { head :no_content }
    end
  end

  #Applying creator pattern (atividade got to be created by a process)
  def new_atividade
    @atividade = Atividade.new
  end

  def create_atividade
    @atividade = Atividade.new(atividade_params)
    @current_processo = Processo.find(params[:id])
    @atividade.processo = @current_processo
    responsavel_to_be_added_email = params[:responsavel]
    @responsavel_to_be_added = Usuario.where(:email => responsavel_to_be_added_email).first
    @atividade.adicionar_responsavel (@responsavel_to_be_added.id)

    respond_to do |format|
      if @atividade.save
        format.html { redirect_to root_path, notice: 'Atividade "'+ @atividade.nome + 
          '" do processo "' + @current_processo.nome + '" criada com sucesso' }
        format.json { render :show, status: :created, location: @atividade }
      else
        format.html { render :new }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_atividade
    @atividade = Atividade.find params[:id]
  end

  def update_atividade
    @atividade = Atividade.find params[:id]
    responsavel_to_be_added_email = params[:responsavel]
    @responsavel_to_be_added = Usuario.where(:email => responsavel_to_be_added_email).first
    if @responsavel_to_be_added
      @atividade.adicionar_responsavel (@responsavel_to_be_added.id)
    end
    respond_to do |format|
      if @atividade.update(atividade_params)
        format.html { redirect_to '/processos', notice: 'Atividade ' + @atividade.nome + ' atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @atividade }
      else
        format.html { render :edit }
        format.json { render json: @atividade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_atividade
    @atividade = Atividade.find params[:id]
    @atividade.destroy
    respond_to do |format|
      format.html { redirect_to '/processos', notice: 'Atividade ' + @atividade.nome + ' deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

    #@atividaide = AtividadesController.new
    #@atividade.create(@curret_processo)
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processo
      @processo = Processo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processo_params
        params.require(:processo).permit(:nome, :descricao, :dataInicio, :dataFim)
        
    end
    def atividade_params
        params.require(:atividade).permit(:nome, :descricao, :dataInicio, :dataFim, :finalizada)
    end

end
