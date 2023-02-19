require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      first_name: "First Name",
      surname: "Surname",
      email: "",
      password_digest: "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Password Digest/)
  end
end
