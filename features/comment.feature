Feature: Comment
  As a user
  I want to be able to add comments on events
  So I can communicate with the organizer

  Scenario: User adds a comment
    Given I am logged in
    # only site admins can see the comments for now
    And I am a site admin
    And an event exists with a title of "Event"
    And I am on the event page of "Event"
    And I fill in "comment_comment" with "New comment"
    And I press "Create Comment"
    # cucumber only sees the comment partial after pressing "Create Comment"
    # that's fine for this test though since we want to know that the comment is displayed
    Then I should see "New comment"
