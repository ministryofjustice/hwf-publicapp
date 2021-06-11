Feature: Using axe-core, evaluate the accessibility of the given page

  Scenario Outline: Check page for accessibility
    Given I visit "<pageName>" page 
    Then the page should be axe clean according to: wcag2a
  

    Examples:
  | pageName | 
  | address page |  
  | benefit page |
  | checklist page |
  | claim page |
  | confirmation done page |
  | confirmation page |
  | contact page |
  | cookies page |
  | dependent page |
  | dob page |
  | fee page |
  | form name page |
  | home office page |
  | income amount page |
  | income kind page |
  | income range page |
  | maritial status page |
  | national insurance presence page |
  | personal details page |
  | probate page |



