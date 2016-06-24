require 'rails_helper'

RSpec.describe "comentarios/edit", type: :view do
  before(:each) do
    @comentario = assign(:comentario, Comentario.create!(
      :assunto => "MyText",
      :conteudo => "MyText"
    ))
  end

  it "renders the edit comentario form" do
    render

    assert_select "form[action=?][method=?]", comentario_path(@comentario), "post" do

      assert_select "textarea#comentario_assunto[name=?]", "comentario[assunto]"

      assert_select "textarea#comentario_conteudo[name=?]", "comentario[conteudo]"
    end
  end
end
