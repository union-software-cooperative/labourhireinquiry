Feature: A company shall have one company, one union and one contact person
	@javascript
	Scenario: Creating an agreement
	Given I am a new, authenticated person 
	Given there's a "company" titled "Mondelez"
	Given there's a "union" titled "NUW"
	When I'm on the "agreements" list
	Then I can add an agreement titled "Mondelez vs NUW" between "Mondelez" and "NUW" and assigned to "Tester"
	
	Scenario: Failing to creating an agreement
	Given I am a new, authenticated person 
	When I'm on the "agreements" list
	Then I can add an agreement with no data