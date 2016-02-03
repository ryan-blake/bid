require "rails_helper"

RSpec.describe LaborersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/laborers").to route_to("laborers#index")
    end

    it "routes to #new" do
      expect(:get => "/laborers/new").to route_to("laborers#new")
    end

    it "routes to #show" do
      expect(:get => "/laborers/1").to route_to("laborers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/laborers/1/edit").to route_to("laborers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/laborers").to route_to("laborers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/laborers/1").to route_to("laborers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/laborers/1").to route_to("laborers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/laborers/1").to route_to("laborers#destroy", :id => "1")
    end

  end
end
