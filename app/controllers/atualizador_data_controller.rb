class AtualizadorDataController < AtualizadorOrganizacaoController

	def template (organizacao_tipo, id)

		#processo
		if organizacao_tipo == 0
			self.visitar_processo(organizacao_tipo, id)

		#projeto
		elsif organizacao_tipo == 1

			self.visitar_processo(organizacao_tipo, id)
			self.visitar_projeto(organizacao_tipo, id)

		#portfolio
		elsif organizacao_tipo == 2

			self.visitar_processo(organizacao_tipo, id)
			self.visitar_projeto(organizacao_tipo, id)
			self.visitar_portfolio id
		end
	end

	def visitar_portfolio(id)
		@portfolio = Portfolio.find(id)
		@datas = Array.new
		@projetos = @portfolio.projetos
		if !@projetos.empty?
			@projetos.each do |projeto|
				@datas << projeto.dataFim
			end 
			@portfolio.update_attribute(:dataFim, @datas.max)
		end

	end

	def visitar_projeto(organizacao_tipo, id)
		#portfolio
		if organizacao_tipo == 2
			@portfolio = Portfolio.find(id)
			@projetos = @portfolio.projetos
			if !@projetos.empty?
				@projetos.each do |projeto|
					visitar_um_projeto(projeto.id)
				end
			end
		

		#projeto
		elsif organizacao_tipo == 1
			self.visitar_um_projeto(id)
		end

	end

	def visitar_processo(organizacao_tipo, id)
		#processo
		if organizacao_tipo == 0
			self.visitar_um_processo(id)

		#projeto
		elsif organizacao_tipo == 1
			self.visitar_processos_de_um_projeto(id)

		#portfolio
		elsif organizacao_tipo == 2
			@portfolio = Portfolio.find(id)
			@projetos = @portfolio.projetos
			if !@projetos.empty?
				@projetos.each do |projeto|
					visitar_processos_de_um_projeto(projeto.id)
				end
			end
		end
	end

	def visitar_um_projeto(id)
		@projeto = Projeto.find(id)
		@datas = Array.new
		@processos = @projeto.processos
		if !@processos.empty?
			@processos.each do |processo|
				@datas << processo.dataFim
			end
			@projeto.update_attribute(:dataFim, @datas.max)
		end
	end

	def visitar_um_processo(id)
		@processo = Processo.find(id)
		@datas = Array.new
		@atividades = @processo.atividades
		if !@atividades.empty?
			@atividades.each do |atividade|
				@datas << atividade.dataFim
			end
			@processo.update_attribute(:dataFim, @datas.max)
		end
	end

	def visitar_processos_de_um_projeto(id)
		@projeto = Projeto.find(id)
		@datas = Array.new
		@processos = @projeto.processos
		if !@processos.empty?
			@processos.each do |processo|
				visitar_um_processo(processo.id)
			end
			@projeto.update_attribute(:dataFim, @datas.max)
		end
	end

end
