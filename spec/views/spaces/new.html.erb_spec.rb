require 'rails_helper'

RSpec.describe "spaces/new", type: :view do
  before(:each) do
    assign(:space, Space.new(
      :name => "MyString",
      :description => "MyText",
      :status => false,
      :join_policy => 1
    ))
  end

  it "renders new space form" do
    render

    assert_select "form[action=?][method=?]", spaces_path, "post" do

      assert_select "input#space_name[name=?]", "space[name]"

      assert_select "textarea#space_description[name=?]", "space[description]"

      assert_select "input#space_status[name=?]", "space[status]"

      assert_select "input#space_join_policy[name=?]", "space[join_policy]"
    end
  end
end
