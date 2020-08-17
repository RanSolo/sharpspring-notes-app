# README

# A simple note management system

demo: https://sharpspring-notes-app.herokuapp.com/

# User Story

As a highly productive employee, I like to take notes throughout my day. This helps me stay focused and remember details and action items.
--------------
Create a simple sign in page that allows an email and password to be submitted for verification. If incorrect credentials are provided, then display an error message indicating this. Upon successful login, a session should be established, and the user should be routed to a dashboard in which they can manage a list of personal notes.
On the notes page, a user should be able to create, retrieve, update
and delete individual notes associated with their account. The bare bones structure of the note dashboard is as 

follows:

[ +New Note ] [ Logout ]
This is a Note Title (created by Joe User, Fri 12:00) [ edit / delete ] This is the note body.
This is another Note Title (created by Joe User, Fri 11:30) [ edit / delete ] This is another note body.
--------------


## Additional Acceptance Criteria

- The note title should not be longer than 30 characters
- The body should not be longer than 1000 characters
- A Note will not be created if it is lacking both a title and a body, but can be created if it is
just lacking a body

- A title is not required, but it should be defaulted to the first 30 characters of the note’s
body

```@note.title = @note.body[0...29] if @note.title.blank?```

## Non-functional requirements
1. Spend some time making the interface look nice (to the best of your ability)
2. Write the application in Ruby on Rails
3. We need a url to run the application
4. It should be hosted on heroku
5. The code should be available in github

## Extra Credit
1. Show off!
2. Include some form of automated tests.
3. Send note as an email
