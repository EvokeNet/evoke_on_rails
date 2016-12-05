require 'rails_helper'

RSpec.describe "space_memberships/index", type: :view do
  before(:each) do
    assign(:space_memberships, [
      SpaceMembership.create!(
        :user => nil,
        :space => nil
      ),
      SpaceMembership.create!(
        :user => nil,
        :space => nil
      )
    ])
  end

  it "renders a list of space_memberships" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
