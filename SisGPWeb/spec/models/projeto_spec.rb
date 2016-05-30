require 'simplecov'
require 'coveralls'

require "spec_helper"
require "rails_helper"
require "projeto"
require 'usuario'

describe Projeto do
	subject(:projeto) { Projeto.new(nome: "teste", descricao: "teste01", dataInicio: nil, dataFim: nil)}

end
