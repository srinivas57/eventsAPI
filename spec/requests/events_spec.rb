require 'rails_helper'

RSpec.describe "Events", type: :request do
  let!(:repo) { FactoryBot.create(:repo) }
  let!(:actor) { FactoryBot.create(:user) }
  let!(:event) { FactoryBot.create(:event, repo_id: repo.id, actor_id: actor.id) }

  describe "GET /index" do
    it "list events" do
      get "/events"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).count).to eq(1)
    end
  end

  describe "GET /create" do
    it "create event" do
      post "/events", params: { event: { event_type: "PushEvent", repo_id: repo.id, actor_id: actor.id } }
      expect(response.status).to eq(201)
    end

    it "create event invalid event_type" do
      lambda {
          post "/events", params: { event: { event_type: "demo", repo_id: repo.id, actor_id: actor.id } }
      }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "GET /show" do
    it "show event" do
      get "/events/#{event.id}"
      expect(response.status).to eq(200)
      expect(response.body).to be_present
    end
  end

  describe "GET /update" do
    it "update event" do
      put "/events/#{event.id}", params: { event: { event_type: "WatchEvent" } }
      expect(response.status).to eq(200)
      expect(response.body).to be_present
    end

    it "update event invalid event_type" do
      lambda {
        put "/events/#{event.id}", params: { event: { event_type: "Test" } }
      }.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
