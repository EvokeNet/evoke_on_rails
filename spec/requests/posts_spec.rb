require 'rails_helper'

RSpec.describe "Posts", type: :request do
  
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_path
      #expect(response).to have_http_status(200)
      expect(response).to redirect_to(:controller => 'posts', :action => 'index')
    end
  end
end
