# Pa11y Accessibility Testing (Help with Fees - Public App)

## Summary
Pa11y is an automated accessibility testing tool.
Pa11y accessibility tests are used to examine whether a site complies with Web Content Accessibility Guidelines (WCAG) 
2.1 standards. w3.org states:

"Following these guidelines will make content more accessible to a wider range of people 
with disabilities, including accommodations for blindness and low vision, deafness and hearing loss, limited movement, 
speech disabilities, photosensitivity, and combinations of these, and some accommodation for learning disabilities and 
cognitive limitations; but will not address every user need for people with these disabilities. These guidelines 
address accessibility of web content on desktops, laptops, tablets, and mobile devices. Following these guidelines will 
also often make Web content more usable to users in general."

The following shows how to implement Pa11y-CI, a variant of Pa11y which iterates over a list of
webpages and highlights accessibility issues.

### Using Pa11y

Install pa11y-ci using documentation at https://github.com/pa11y/pa11y-ci.

There is a test for the local environment in the pa11y/tests directory. The following describes how to test
locally:

#### Local environment:

First, open 3 terminal windows and cd into project directory, e.g. hwf-publicapp in two, and hwf-staffapp in the other. Next, in one terminal, 
launch the hwf-publicapp local web server using:
 ```
 rails s -p 3001
 ```
In the second, hwf-staffapp terminal, launch the hwf-staffapp local web server using:
 ```
 rails s -p 3000
 ```
Then, depending on whether you want to carry out the text with screenshots (for debugging) or not, copy and execute the respective command(s) in
the remaining third terminal:

with screenshots:
```
mkdir -p pa11y/screenshots/local     
pa11y-ci --config pa11y/tests/local/.pa11yci_ss.json
```
without screenshots:
```
pa11y-ci --config pa11y/tests/local/.pa11yci.json
```
(Screenshots can be useful to check whether the desired page is being tested. You may want to delete the screenshot 
directory after testing to avoid clutter).

### WCAG standards

In the default configuration, the compliance standard is WCAG2.1AA. To change this, go to the .pa11yci.json (or 
.pa11yci_ss.json) file and change the 'standard' attribute to either WCAG2.1A, WCAG2.1AA or WCAG2.1AAA.

### Official documentation

https://github.com/pa11y/pa11y-ci