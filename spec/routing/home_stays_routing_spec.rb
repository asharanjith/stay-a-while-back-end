require "rails_helper"

RSpec.describe HomeStaysController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/home_stays").to route_to("home_stays#index")
    end

    it "routes to #show" do
      expect(get: "/home_stays/1").to route_to("home_stays#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/home_stays").to route_to("home_stays#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/home_stays/1").to route_to("home_stays#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/home_stays/1").to route_to("home_stays#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/home_stays/1").to route_to("home_stays#destroy", id: "1")
    end
  end
end
