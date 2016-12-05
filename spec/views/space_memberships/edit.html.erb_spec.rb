require 'rails_helper'

RSpec.describe "space_memberships/edit", type: :view do
  before(:each) do
    @space_membership = assign(:space_membership, SpaceMembership.create!(
      :user => nil,
      :space => nil
    ))
  end

  it "renders the edit space_membership form" do
    render

    assert_select "form[action=?][method=?]", space_membership_path(@space_membership), "post" do

      assert_select "input#space_membership_user_id[name=?]", "space_membership[user_id]"

      assert_select "input#space_membership_space_id[name=?]", "space_membership[space_id]"
    end
  end
end
