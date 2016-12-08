require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "New",
      :lastname => "User",
      :password => "password",
      :email => "user@example.com"
    ))

    @space = assign(:space, Space.new(
      :name => "MyString",
      :description => "MyText",
      :visibility => :open,
      :user => @user
    ))

    assign(:posts, [
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :user => @user,
        :space => @space
      ),
      Post.create!(
        :title => "Title",
        :body => "MyText",
        :user => @user,
        :space => @space
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "MyString".to_s, :count => 2
  end
end
