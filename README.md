nyt-code-test-nyregion
======================

This is Rails 4 project, on ruby 2.0.0-p0

I can host it on heroku if you'd like.

to run it locally, run:

	rails s

useful links:

rbenv: https://github.com/sstephenson/rbenv

rails: http://rubyonrails.org/


---------------------

Bugs:

---------------------

- Clicking on Load More when in the mrtn language wont load martian translated stories, it will load english ones.
- Also switching from en to martian can crash the client request for more stories.

---------------------

The Assignment

---------------------

At the following url (http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion2.js), you'll find a json file that gives you a list of stories, headlines, summaries and photos about New York. Your task is to use the server-side language and framework of your choice (bonus points for using Rails or Sinatra) to create a web page that does the following:

1. Fetches the contents of the nyregion2 json file and renders the list of stories in a simple list form with the information you think should display for each article. Extra points for making a beautiful, "Timesian" presentation of the list. Make sure its' responsive with a design to accommodate a web, tablet and phone breakpoint.


2.  Create the ability to toggle between English and a fake Martian language that follows these rules:

	> every word three characters or less is left alone

	> every word more than three characters is replaced with boinga.

	> Maintain the same capitalization and punctuation in the English and Martian versions.

3. Make sure the page responds with a status of 403 if it receives anything other than a GET request.

4. Create the ability to load older stories onto the page with a client side request for the following JSONP file (http://np-ec2-nytimes-com.s3.amazonaws.com/dev/test/nyregion.js).  When triggered, these stories should be appended to the list already rendered on the page.

5. When you're done, place all your code in a single folder, zip it up and send it back our way. Please don't minify any of the javascript or css you use in the app, and include any instructions we’ll need to get it up and running.
