require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      first_name: "MyString",
      surname: "MyString",
      email: "",
      password_digest: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[surname]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password_digest]"
    end
  end
end
