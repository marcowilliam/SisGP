class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :block_organization_access

  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolios = current_user.portfolios
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    @projetos = current_user.projetos
    @projetos = @projetos.where(:portfolio => nil)
    @idenficador_organizacao = 0
  end

  # GET /portfolios/1/edit
  def edit
    @projetos = current_user.projetos
    @projetos = @projetos.where(:portfolio => nil)
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.adicionar_dono current_user.id
    @projetos_added = params[:projetos_added]
    if @projetos_added
      @portfolio.adicionar_projeto @projetos_added
    else
      #do nothing
    end


    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to '/portfolios', notice: 'Portfolio ' + @portfolio.nome + ' criado com sucesso.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    @projetos_added = params[:projetos_added]
    
    dono_to_be_added_email = params[:dono]
    @dono_to_be_added = Usuario.where(:email => dono_to_be_added_email).first
    if @dono_to_be_added
      @portfolio.adicionar_dono (@dono_to_be_added.id)
    else
      #do nothing
    end

    if @projetos_added
      @portfolio.adicionar_projeto @projetos_added
    else
      #do nothing
    end

    respond_to do |format|
      if @portfolio.update(portfolio_params) 
        format.html { redirect_to '/portfolios', notice: 'Portfolio '  + @portfolio.nome + ' atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio '  + @portfolio.nome + ' deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:nome, :descricao, :dataInicio, :dataFim, :projetos)
    end
end
