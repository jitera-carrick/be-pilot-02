require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      name: "MyString",
      description: "MyString",
      price: "9.99"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[name]"

      assert_select "input[name=?]", "book[description]"

      assert_select "input[name=?]", "book[price]"
    end
  end
end
