Feature: Create events

  Scenario: get the list of all events
    Given Repositary and Users are avaible
    When I request event create API call with following params
      | filed      | value     |
      | event_type | PushEvent |
      | public     | true      |
      | repo_id    | <repo_id> |
      | actor_id    | <actor_id>| 
    Then the API response should be 201
