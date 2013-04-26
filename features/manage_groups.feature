Feature: Manage Groups
	In order to create collections of people
	As a user
	I want to create and manage groups

	Scenario: Groups List
		Given I have groups titled Asian Student Association, CMU Bhangra
		When I go to the list of groups
		Then I should see "Asian Student Association"
		And I should see "CMU Bhangra"

	Scenario: Create Valid Group
	    Given I have no groups
	    And I am on the list of groups
	    When I follow "New Group"
	    And I fill in "Name" with "Asian Student Association"
	    And I fill in "Description" with "Asian people doing things!"
	    And I press "Create"
	    Then I should see "Group was successfully created"
	    And I should see "Asian Student Association"
	    And I should see "Asian people doing things!"
	    And I should have 1 group
