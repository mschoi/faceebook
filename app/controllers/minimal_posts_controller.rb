# This file is not actually used in the application (it's named improperly as 'minimal_posts_controller')
# It's name breaks the convention of naming controller files for the things they deal with using lowercase
# and plural.

# This is here so you can see what parts of the scaffolded controllers are non-essential,
# and get an English translation of what some of the controller code is doing.

class PostsController < ApplicationController

  # this controller action passes the view a list of all the posts
  def index
    # the @ symbol in front of the word posts makes it into a special kind of variable
    # that we can pass to the view
    @posts = Post.all
    # capitalizing Post and referring to it singularly means we want to talk to the model
    # in our application. The .all is a built-in method that returns pretty much all the
    # data from the Post table in our database.
  end

  # when someone goes to this url and adds a slash number (e.g., localhost:3000/posts/3)
  # this will try to look up a post with an id that matches the number at the end of
  # the url, and pass the view all of the data associated with that post (e.g., it's content)
  def show
    @post = Post.find(params[:id])
    # find is a built in method to look things up in a Model using their id
    # params[:id] is what grabs the number from the end of the url
  end

  # this creates a new instance of a post and passes it to the view so that a user
  # can add attributes to the post using a form
  def new
    @post = Post.new

    # this code is not strictly necessary. Basically, web applications can give back
    # data in formats other than HTML, and this piece of code tells rails what to do when
    # it's asked for html data or data in another format (in this case, json)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # this function looks up a post and sends its information to a view where the 
  # user can modify that information
  def edit
    @post = Post.find(params[:id])
  end

  # after a user adds details to a post instance using the form in the 'new' view,
  # this controller action actually uses the data that the user submits to save
  # the post to the database
  def create
    @post = Post.new(params[:post])

    # if the post saves (the save method returns true or false)
    if @post.save
      # then send the user to the posts list view, and send a notice with it
      # so the user knows they were successful
      format.html { redirect_to @post, notice: 'Post was successfully created.' }
    else
      # if the post doesn't save for some reason, send the user back to the
      # 'new' view
      format.html { render action: "new" }
    end
  end

  # similar to the create method, this takes infomration that a user adds in an 'edit'
  # view and uses it to update the information in the database
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      format.html { redirect_to @post, notice: 'Post was successfully updated.' }
    else
      format.html { render action: "edit" }
    end
  end

  # when the user clicks the delete button for an item, this is what then runs to 
  # delete that post (identified by its id) in the database by calling the destroy
  # method
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    format.html { redirect_to posts_url }
  end
end
