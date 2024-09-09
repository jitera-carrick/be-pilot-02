require 'rails_helper'

RSpec.describe "kais/new", type: :view do
  before(:each) do
    assign(:kai, Kai.new(
      name: "MyString",
      description: "MyString",
      price: "9.99"
    ))
  end

  it "renders new kai form" do
    render

    assert_select "form[action=?][method=?]", kais_path, "post" do

      assert_select "input[name=?]", "kai[name]"

      assert_select "input[name=?]", "kai[description]"

      assert_select "input[name=?]", "kai[price]"
    end
  end
end
