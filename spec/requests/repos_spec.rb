require 'rails_helper'

RSpec.describe "Repos", type: :request do
  let!(:repo) { FactoryBot.create(:repo) }
  let!(:actor) { FactoryBot.create(:user) }
  let!(:event) { FactoryBot.create(:event, repo_id: repo.id, actor_id: actor.id) }

  describe "GET repo display with events" do
    it "list events" do
      get "/repos/#{repo.id}/events"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).count).to eq(1)
    end
  end
end
