Feature: Create events

  Scenario: get the list of all events
    Given events are avaible in database
    When I request event Update API call with following params
      | filed      | value      |
      | event_type | WatchEvent |
    Then the API response should be 200
