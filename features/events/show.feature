Feature: Show events

  Scenario: get the list of all events
    Given events are avaible in database
    When I request Show API call
    Then the API response should be 200
