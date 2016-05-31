require 'rails_helper'

RSpec.describe "departamentos/show", type: :view do
  before(:each) do
    @departamento = assign(:departamento, Departamento.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
