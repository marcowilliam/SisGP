require 'rails_helper'

RSpec.describe "comentarios/new", type: :view do
  before(:each) do
    assign(:comentario, Comentario.new(
      :assunto => "MyText",
      :conteudo => "MyText"
    ))
  end

  it "renders new comentario form" do
    render

    assert_select "form[action=?][method=?]", comentarios_path, "post" do

      assert_select "textarea#comentario_assunto[name=?]", "comentario[assunto]"

      assert_select "textarea#comentario_conteudo[name=?]", "comentario[conteudo]"
    end
  end
end
