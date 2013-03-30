# ABOUT MODELS

# This is a model file for a User (note that model files are always referred to as singular and
# are Capitalized. A lot of what the model does in the application is invisible, because it is built on 
# top of code that's already part of the Rails framework (in the ActiveRecord::Base class -- 
# do you see where that is in this file?)

# Models are what interface with your database. They're also in charge of things like:
# - validating user submitted data
# - making sure that users don't access data that they should not
# - making different queries into the database (e.g., asking for all the users whose 
#   birthday is in January, or sorting all users alphabetically)

# The actual code for the model starts here:
class User < ActiveRecord::Base
  # this line defines what attributes users can edit. Most attributes will be in this list, 
  # because we want people to be able to edit information from their browsers, but some
  # attributes, like ids, shouldn't be available to users to edit
  attr_accessible :birthday, :email, :first_name, :gender, :last_name, :password, :username

  # Relationships
  # ---------------
  # Setting up relationships in rails lets you link models together. Writing these lines of code is 
  # what lets rails know how your models relate and what different database tables it should look for.

  # a User has many posts that they make to the central 'newsfeed' in our application. because we
  # called the id which keeps track of the user who wrote the post an 'author_id' instead of a user_id,
  # you have to explicitly tell rails that, for posts, we called users authors and that's what it should
  # look at when it's trying to figure out what user wrote a post.
  has_many :posts, foreign_key: 'author_id'

  # a user also has many events. Since events keep track of the people who created them with the 
  # foreign key 'user_id', rails can automatically figure out that that corresponds to the User model
  # (because user is the same word as User) and we don't have to explicitly define a foreign key.
  has_many :events

  # Methods
  # -------------
  # This method tells the model what to give us when we ask it for someone's name. When we ask for
  # someone's name using this method, we want it to return something like "John Smith" (combining 
  # the person's first name and last name (which we get from the database, and separating them with a space.)
  def name
    "#{self.first_name} #{self.last_name}"
    # the syntax of "#{something}"" tells rails that the something that you've marked off with a
    # pound sign (#) and braces ({}) inside the string is a variable that you want to replace
    # with that variable's value

    # other ways to write this which work:
    # return "#{self.first_name} #{self.last_name}"
    # return self.first_name + ' ' + self.last_name

    # NOTE
    # in ruby/rails, if you don't say 'return' (which explicitly tells the function to stop and give you back
    # the value after that word), then it will return the last thing that you define (in this case, a string 
    # joining the first name and last name.)
  end

  # This method uses the ruby 'join' method (which sticks together two array elements and takes a
  # separator as a parameter) to join together the last name and first name of a user with a comma and
  # a space.
  def name_proper
    [last_name, first_name].join(', ')
  end
end
