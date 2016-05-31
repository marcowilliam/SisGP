class CriadorOrganizacaoController < CriadorController

	def new
			@portfolio = Portfolio.new
			@projeto = Projeto.new
			@processo = Processo.new
	end

	def create
		identificador_organizacao = params[:identificador_organizacao]
		if identificador_organizacao == '0' 
			@portfolio = self.create_portfolio
		elsif identificador_organizacao == '1' 
			@projeto = self.create_projeto
		elsif identificador_organizacao == '2' 
			@processo = self.create_processo
		else 
			#do nothing
		end
	end



	def create_portfolio
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

	def create_projeto
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

	def create_processo
		@processo = Processo.new(processo_params)
	    @processo.adicionar_dono current_user.id
	    @projeto_to_be_added = params[:projeto]
	    respond_to do |format|
	      if @processo.save
	        format.html { redirect_to '/processos', notice: 'Processo '+ @processo.nome + ' criado com sucesso' }
	        format.json { render :show, status: :created, location: @processo }
	      else
	        format.html { render :new }
	        format.json { render json: @processo.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:nome, :descricao, :dataInicio, :dataFim, :projetos)
    end
    
    def projeto_params
      params.require(:projeto).permit(:nome, :descricao, :dataInicio, :dataFim, :processos)
    end

    def processo_params
        params.require(:processo).permit(:nome, :descricao, :dataInicio, :dataFim) 
    end

end
