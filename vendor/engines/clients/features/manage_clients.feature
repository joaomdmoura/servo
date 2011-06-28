@clients
Feature: Clients
  In order to have clients on my website
  As an administrator
  I want to manage clients

  Background:
    Given I am a logged in refinery user
    And I have no clients

  @clients-list @list
  Scenario: Clients List
   Given I have clients titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of clients
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @clients-valid @valid
  Scenario: Create Valid Client
    When I go to the list of clients
    And I follow "Add New Client"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 client

  @clients-invalid @invalid
  Scenario: Create Invalid Client (without name)
    When I go to the list of clients
    And I follow "Add New Client"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 clients

  @clients-edit @edit
  Scenario: Edit Existing Client
    Given I have clients titled "A name"
    When I go to the list of clients
    And I follow "Edit this client" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of clients
    And I should not see "A name"

  @clients-duplicate @duplicate
  Scenario: Create Duplicate Client
    Given I only have clients titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of clients
    And I follow "Add New Client"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 clients

  @clients-delete @delete
  Scenario: Delete Client
    Given I only have clients titled UniqueTitleOne
    When I go to the list of clients
    And I follow "Remove this client forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 clients
 