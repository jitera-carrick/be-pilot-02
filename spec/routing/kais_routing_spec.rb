require "rails_helper"

RSpec.describe KaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/kais").to route_to("kais#index")
    end

    it "routes to #new" do
      expect(get: "/kais/new").to route_to("kais#new")
    end

    it "routes to #show" do
      expect(get: "/kais/1").to route_to("kais#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/kais/1/edit").to route_to("kais#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/kais").to route_to("kais#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/kais/1").to route_to("kais#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/kais/1").to route_to("kais#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/kais/1").to route_to("kais#destroy", id: "1")
    end
  end
end
