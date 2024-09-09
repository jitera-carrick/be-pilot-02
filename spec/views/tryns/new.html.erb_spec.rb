require 'rails_helper'

RSpec.describe "tryns/new", type: :view do
  before(:each) do
    assign(:tryn, Tryn.new(
      name: "MyString",
      description: "MyString",
      price: "9.99"
    ))
  end

  it "renders new tryn form" do
    render

    assert_select "form[action=?][method=?]", tryns_path, "post" do

      assert_select "input[name=?]", "tryn[name]"

      assert_select "input[name=?]", "tryn[description]"

      assert_select "input[name=?]", "tryn[price]"
    end
  end
end
