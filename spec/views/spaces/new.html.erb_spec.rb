require 'rails_helper'

RSpec.describe "spaces/new", type: :view do
  before(:each) do
    assign(:space, Space.new(
      :name => "MyString",
      :description => "MyText",
      :visibility => :open,
      :user => nil
    ))
  end

  it "renders new space form" do
    render

    assert_select "form[action=?][method=?]", spaces_path, "post" do

      assert_select "input#space_name[name=?]", "space[name]"

      assert_select "textarea#space_description[name=?]", "space[description]"

      assert_select "select#space_visibility[name=?]", "space[visibility]"

    end
  end
end
