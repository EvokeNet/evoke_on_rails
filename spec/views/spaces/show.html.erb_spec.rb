require 'rails_helper'

RSpec.describe "spaces/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "New",
      :lastname => "User",
      :password => "password",
      :email => "user@example.com"
    ))

    @space = assign(:space, Space.create!(
      :name => "Name",
      :description => "MyText",
      :visibility => :open,
      :user => @user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/New/)
  end
end
