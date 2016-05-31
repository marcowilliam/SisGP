require 'rails_helper'

RSpec.describe "departamentos/new", type: :view do
  before(:each) do
    assign(:departamento, Departamento.new())
  end

  it "renders new departamento form" do
    render

    assert_select "form[action=?][method=?]", departamentos_path, "post" do
    end
  end
end
