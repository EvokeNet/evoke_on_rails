require 'rails_helper'

RSpec.describe "SpaceMemberships", type: :request do
  describe "GET /space_memberships" do
    it "works! (now write some real specs)" do
      get space_memberships_path
      expect(response).to have_http_status(200)
    end
  end
end
