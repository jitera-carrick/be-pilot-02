require 'rails_helper'

RSpec.describe "tryns/index", type: :view do
  before(:each) do
    assign(:tryns, [
      Tryn.create!(
        name: "Name",
        description: "Description",
        price: "9.99"
      ),
      Tryn.create!(
        name: "Name",
        description: "Description",
        price: "9.99"
      )
    ])
  end

  it "renders a list of tryns" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
