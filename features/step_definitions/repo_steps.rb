Given('events and repos are avaible in database') do
  @repo = Repo.create(name: "repo1")
  user = User.create(name: "srinu7")
  event =  Event.create!(event_type: "PushEvent", repo_id: @repo.id, actor_id: user.id)
end

When('I request repo Show API call with events') do
 get "/repos/#{@repo.id}/events"
end
