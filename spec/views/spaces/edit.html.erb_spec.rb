require 'rails_helper'

RSpec.describe "spaces/edit", type: :view do
  before(:each) do
    @space = assign(:space, Space.create!(
      :name => "MyString",
      :description => "MyText",
      :visibility => :open,
      :user => nil
    ))
  end

  it "renders the edit space form" do
    render

    assert_select "form[action=?][method=?]", space_path(@space), "post" do

      assert_select "input#space_name[name=?]", "space[name]"

      assert_select "textarea#space_description[name=?]", "space[description]"

      assert_select "select#space_visibility[name=?]", "space[visibility]"

    end
  end
end
