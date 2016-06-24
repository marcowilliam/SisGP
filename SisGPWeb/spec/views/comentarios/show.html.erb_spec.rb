require 'rails_helper'

RSpec.describe "comentarios/show", type: :view do
  before(:each) do
    @comentario = assign(:comentario, Comentario.create!(
      :assunto => "MyText",
      :conteudo => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
