require "rails_helper"

RSpec.describe MoviesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/movies").to route_to("movies#index")
    end

    it "routes to #show" do
      expect(get: "/api/movies/1").to route_to("movies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/movies").to route_to("movies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/movies/1").to route_to("movies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/movies/1").to route_to("movies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/movies/1").to route_to("movies#destroy", id: "1")
    end
  end
end
