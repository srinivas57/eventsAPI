Given('events are avaible in database') do
  repo = Repo.create(name: "repo1")
  user = User.create(name: "srinu7")
  @event =  Event.create!(event_type: "PushEvent", repo_id: repo.id, actor_id: user.id)
end

When('I request Index API call') do
  get '/events'
end

Then('the API response should be {int}') do |int|
  expect(last_response.status).to eq(int)
end

When('I request Show API call') do
  get "/events/#{@event.id}"
end

Given('Repositary and Users are avaible') do
  @repo = Repo.create(name: "repo1")
  @user = User.create(name: "srinu7")
end

When('I request event create API call with following params') do |table|
  data = table.rows.to_h
  data['repo_id'] = @repo.id if data['repo_id'] == '<repo_id>'
  data['actor_id'] = @user.id if data['actor_id'] == '<actor_id>'
  post '/events', data.to_json, 'CONTENT_TYPE' => 'application/json'
end

When('I request event Update API call with following params') do |table|
  data = table.rows.to_h
  put "/events/#{@event.id}", data.to_json, 'CONTENT_TYPE' => 'application/json'
end
