require 'usuario'

class ProcessosController < OrganizacaoInterface
  before_action :set_processo, only: [:show, :edit, :update, :destroy]
  before_action :block_organization_access

  # GET /processos
  # GET /processos.json
  def index
    @processos = current_user.processos
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
    @processo.add_dono current_user.id
    respond_to do |format|
      if @processo.save
        format.html { redirect_to @processo, notice: 'Processo was successfully created.' }
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
      @processo.add_dono (@dono_to_be_added.id)
      if @processo.update(processo_params)
        format.html { redirect_to @processo, notice: 'Processo was successfully updated.' }
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
    @processo.destroy
    respond_to do |format|
      format.html { redirect_to processo_url, notice: 'Processo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processo
      @processo = Processo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processo_params
      params.require(:processo).permit(:nome, :descricao, :dataInicio, :dataFim)
    end
end
