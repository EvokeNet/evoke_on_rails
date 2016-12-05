require 'rails_helper'

RSpec.describe "spaces/index", type: :view do
  before(:each) do
    assign(:spaces, [
      Space.create!(
        :name => "Name",
        :description => "MyText",
        :status => false,
        :join_policy => 2
      ),
      Space.create!(
        :name => "Name",
        :description => "MyText",
        :status => false,
        :join_policy => 2
      )
    ])
  end

  it "renders a list of spaces" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
