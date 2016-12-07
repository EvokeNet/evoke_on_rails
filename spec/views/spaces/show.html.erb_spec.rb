require 'rails_helper'

RSpec.describe "spaces/show", type: :view do
  before(:each) do
    assigns(@post)
    @space = assign(:space, Space.create!(
      :id => 1,
      :name => "Name",
      :description => "MyText",
      :status => false,
      :join_policy => 2
    ))
    @space = Space.where(id: 1).includes(:post).take
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
  end
end
