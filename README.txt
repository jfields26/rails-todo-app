Final project: ToDo app

Jarred Fields

Development Process
    This app was built using Ruby on Rails, using Devise for authentication and 
Bootstrap 5, Font Awesome, and JavaScript for UI. Users can create accounts where they
create categories and todos within them. Todos can be marked complete or priority, and
can have notes added to them for additional information. I added an account settings 
page where users can change their information in addition to the three required pages. 
The interface is very user friendly and all formatting and button options were chosen
deliberately for a clean looking app that allows space for users to take advantage of
and make todos as detailed as they want, particularly on the categories page. More 
details about the app are included in the directions to test the application.

Requires:
- Ruby (version 3.4.1)
- Rails (version 8.0.5)

Installation and Setup Instructions:
1. Clone the repository:
git clone <link>
2. Navigate into the project folder:
cd todo_app
3. Install the required gems:
bundle install
4. Set up the database:
rails db:create
rails db:migrate
5. Start the rails server:
rails server
6. Open the app in your browser:
http://localhost:3000

How to Use/Test the Application
1. Click "Sign up" to create an account
2. Create a ToDo by going to the ToDos page or create a category by going to the 
'Categories' page. ToDos can be created without a category if preferred and they can
be added to and removed from categories by editing the ToDo. ToDos can be marked as
priority or completed. Completed ToDos show up on the Completed ToDos page. 
3. To view a user account, go to settings using the 'Settings' button in the navbar.
All user information can be changed from this page by using the 'Edit Info' and
'Change Password' buttons. The account can be deleted by using the 'Delete Account'
button on this page as well. This will delete all information, ToDos, and categories
associated with that user. Each user only has access to their own categories and ToDos

Deployment:
Live App: <your deployed link>

GitHub Repo:
https://github.com/jfields26/rails-todo-app