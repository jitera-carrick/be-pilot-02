require 'rails_helper'

RSpec.describe "tryns/edit", type: :view do
  before(:each) do
    @tryn = assign(:tryn, Tryn.create!(
      name: "MyString",
      description: "MyString",
      price: "9.99"
    ))
  end

  it "renders the edit tryn form" do
    render

    assert_select "form[action=?][method=?]", tryn_path(@tryn), "post" do

      assert_select "input[name=?]", "tryn[name]"

      assert_select "input[name=?]", "tryn[description]"

      assert_select "input[name=?]", "tryn[price]"
    end
  end
end
