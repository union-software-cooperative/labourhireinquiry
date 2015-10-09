Feature: Home Page
	Scenario: View application's home page
	Given there's an agreement titled "UFCW LOCAL 700/ConAgra Foods - Indianapolis, Indiana, USA" expiring "4 March 2017"
	When I am on the homepage
	Then I should see the "UFCW LOCAL 700/ConAgra Foods - Indianapolis, Indiana, USA" agreement
	Then I should see the link "directory"
	Then I should see the link "agreements"
	When I click the "directory" link 
	Then I see a list of "People"
	When I click the "agreements" link 
	Then I see a list of "Agreements"

