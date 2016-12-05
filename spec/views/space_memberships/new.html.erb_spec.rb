require 'rails_helper'

RSpec.describe "space_memberships/new", type: :view do
  before(:each) do
    assign(:space_membership, SpaceMembership.new(
      :user => nil,
      :space => nil
    ))
  end

  it "renders new space_membership form" do
    render

    assert_select "form[action=?][method=?]", space_memberships_path, "post" do

      assert_select "input#space_membership_user_id[name=?]", "space_membership[user_id]"

      assert_select "input#space_membership_space_id[name=?]", "space_membership[space_id]"
    end
  end
end
