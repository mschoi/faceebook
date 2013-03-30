# This is a migration. Rails (again with the magic) handles a lot of details
# of connecting with different types of databases for you, and this file is part
# of how it does that.

class CreateEvents < ActiveRecord::Migration
  # This function is what is run when you ask rails to create the database, and 
  # explains specifically how this particular database should be made/what it 
  # should contain.
  def change
    # first step, make a table (with a very few exceptions, every model has a matching
    # database table in rails)
    create_table :events do |t|
      # then list out all the different things we want to store in that database, along
      # with the type of data that those things are

      # name is a short bit of text, a string
      t.string :name 

      # description is a longer piece of text (like, paragraphs) so it's type is text
      t.text :description 

      # the start date and time of an event has the type 'datetime'
      t.datetime :start_datetime
      t.datetime :end_datetime

      # the user_id  of the person who made this event is a number--an integer
      t.integer :user_id

      # you can see all the different types of data that you can use here and read
      # more about migrations at this link:
      # http://guides.rubyonrails.org/migrations.html
      # * note: The list of possible data types is under section 1.4, 'Supported Types'

      t.timestamps
    end
  end
end
