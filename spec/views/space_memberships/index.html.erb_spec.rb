require 'rails_helper'

RSpec.describe "space_memberships/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "New",
      :lastname => "User",
      :password => "password",
      :email => "user@example.com"
    ))

    @user2 = assign(:user, User.create!(
      :name => "New",
      :lastname => "User",
      :password => "password",
      :email => "user2@example.com"
    ))

    @space = assign(:space, Space.new(
      :name => "MyString",
      :description => "MyText",
      :visibility => :open,
      :user => @user
    ))

    assign(:space_memberships, [
      SpaceMembership.create!(
        :user => @user,
        :space => @space
      ),
      SpaceMembership.create!(
        :user => @user2,
        :space => @space
      )
    ])
  end

  it "renders a list of space_memberships" do
    render
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
  end
end
