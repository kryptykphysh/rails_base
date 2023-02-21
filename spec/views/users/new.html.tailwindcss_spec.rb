require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      first_name: "MyString",
      surname: "MyString",
      email: "",
      password_digest: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[surname]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password_digest]"
    end
  end
end
