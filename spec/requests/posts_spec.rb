require 'rails_helper'

RSpec.describe "Posts", type: :request do

  config.include FactoryGirl::Syntax::Methods

  describe "GET /posts" do
    it "works! (now write some real specs)" do
      FactoryGirl.factories.clear
      FactoryGirl.find_definitions  
    	FactoryGirl.define do
		    factory :user do
		        email "aabb@hh.de"
		        password "rubyruby"
		    end
		  end
      @user ||= FactoryGirl.create :user
      sign_in @user
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
end
