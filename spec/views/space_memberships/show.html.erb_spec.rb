require 'rails_helper'

RSpec.describe "space_memberships/show", type: :view do
  before(:each) do
    @space_membership = assign(:space_membership, SpaceMembership.create!(
      :user => nil,
      :space => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
