require "rails_helper"

RSpec.describe SpaceMembershipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/space_memberships").to route_to("space_memberships#index")
    end

    it "routes to #new" do
      expect(:get => "/space_memberships/new").to route_to("space_memberships#new")
    end

    it "routes to #show" do
      expect(:get => "/space_memberships/1").to route_to("space_memberships#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/space_memberships/1/edit").to route_to("space_memberships#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/space_memberships").to route_to("space_memberships#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/space_memberships/1").to route_to("space_memberships#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/space_memberships/1").to route_to("space_memberships#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/space_memberships/1").to route_to("space_memberships#destroy", :id => "1")
    end

  end
end
