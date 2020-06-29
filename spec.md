# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    Used Sinatra to connect routes between models, views, and controllers
- [x] Use ActiveRecord for storing information in a database
    Used ActiveRecord to store and manage the databases
- [x] Include more than one model class (e.g. User, Post, Category)
    Includes 5 model classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    Includes multiple has_many relationshiops (users, restaurants, cuisines, cities)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    Includes two belongs_to (reviews, restaurants)
- [x] Include user accounts with unique login attribute (username or email)
    Includes both users and admins with login verfication on each page
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    Reviews can follow CRUD
- [x] Ensure that users can't modify content created by other users
    Reviews are restricted by review.user == current_user? Other model classes restricted by admin
- [x] Include user input validations
    Review form include validations, signup includes validations for user creation
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    Error pages for missing route, missing data, and user restriction in place
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    Includes all pertinent data 

Confirm
- [x] You have a large number of small Git commits
    Every couple of minutes
- [x] Your commit messages are meaningful
    Most of the time
- [x] You made the changes in a commit that relate to the commit message
    Most of the time
- [x] You don't include changes in a commit that aren't related to the commit message
    Most of the time