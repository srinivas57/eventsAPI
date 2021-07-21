Feature: Show repo events

  Scenario: get the list of all events
    Given events and repos are avaible in database
    When I request repo Show API call with events
    Then the API response should be 200
