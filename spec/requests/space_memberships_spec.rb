require 'rails_helper'

RSpec.describe "SpaceMemberships", type: :request do
  
  describe "GET /space_memberships" do
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
