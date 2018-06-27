require "spec_helper"

describe SupergroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/supergroups").should route_to("supergroups#index")
    end

    it "routes to #new" do
      get("/supergroups/new").should route_to("supergroups#new")
    end

    it "routes to #show" do
      get("/supergroups/1").should route_to("supergroups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supergroups/1/edit").should route_to("supergroups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supergroups").should route_to("supergroups#create")
    end

    it "routes to #update" do
      put("/supergroups/1").should route_to("supergroups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supergroups/1").should route_to("supergroups#destroy", :id => "1")
    end

  end
end
