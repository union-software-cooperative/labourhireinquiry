Feature: Maintain a list of unions
	Scenario: Add a union
		When I'm on the "unions" list
		Then I can add a "union" titled "NUW"
		
	Scenario: Edit a union
		Given there's a "union" titled "NUW"
		When I'm on the "unions" list
		Then I can edit the "union" titled "NUW"
	
	Scenario: Delete a union
		Given there's a "union" titled "NUW"
		When I'm on the "unions" list
		Then I can delete the "union" titled "NUW"
	