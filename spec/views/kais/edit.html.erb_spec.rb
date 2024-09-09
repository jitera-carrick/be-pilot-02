require 'rails_helper'

RSpec.describe "kais/edit", type: :view do
  before(:each) do
    @kai = assign(:kai, Kai.create!(
      name: "MyString",
      description: "MyString",
      price: "9.99"
    ))
  end

  it "renders the edit kai form" do
    render

    assert_select "form[action=?][method=?]", kai_path(@kai), "post" do

      assert_select "input[name=?]", "kai[name]"

      assert_select "input[name=?]", "kai[description]"

      assert_select "input[name=?]", "kai[price]"
    end
  end
end
