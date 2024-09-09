require "rails_helper"

RSpec.describe TrynsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tryns").to route_to("tryns#index")
    end

    it "routes to #new" do
      expect(get: "/tryns/new").to route_to("tryns#new")
    end

    it "routes to #show" do
      expect(get: "/tryns/1").to route_to("tryns#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tryns/1/edit").to route_to("tryns#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tryns").to route_to("tryns#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tryns/1").to route_to("tryns#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tryns/1").to route_to("tryns#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tryns/1").to route_to("tryns#destroy", id: "1")
    end
  end
end
