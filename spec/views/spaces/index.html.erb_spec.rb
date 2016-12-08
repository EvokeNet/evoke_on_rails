require 'rails_helper'
require 'rspec/rails'
require 'devise'

RSpec.describe "spaces/index", type: :view do

  include Devise::TestHelpers                          
  include Warden::Test::Helpers
  
  before(:each) do
    
    @user = assign(:user, User.create!(
      :name => "New",
      :lastname => "User",
      :password => "password",
      :email => "user@example.com"
    ))
    
    current_user = @user
    sign_in current_user

    assign(:spaces, [
      Space.create!(
        :name => "Name",
        :description => "MyText",
        :visibility => :open,
        :user => @user
      ),
      Space.create!(
        :name => "Name",
        :description => "MyText",
        :visibility => :open,
        :user => @user
      )
    ])
  end
  
  it "renders a list of spaces" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
  end
end
