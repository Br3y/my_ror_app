class PostsController < ApplicationController
  def index
    # code to grab all posts so they can be
    # displayed in the Index view (index.html.erb)
    @posts = Post.all
  end

  def show
    # code to grab the proper Post so it can be
    # displayed in the Show view (show.html.erb)
    @user = User.find(params[:id])
  end

  # Make (but don't save) an empty Post so the form we render
  # knows which fields to sue and where to submit the form
  # This action will render app/views/posts/new.html.erb once
  # and it's done
  def new
    # code to create an empty post and sent the user
    # to the New view for it (new.html.erb), which will have a
    # form for creating the post
    @post = Post.new
  end

  # We know this will get run once we receive the submitted
  # form from our NEW action above (remember your REST actions??)
  # We'll just use pseudo-code for now to illustrate point
  def create
    # code to create a new post based on the parameters that
    # were submitted with the form (and are now available in the
    # params hash)
    
    @post = Post.new(allow_post_params) # see methods below
    # code here to set up up a new @post based on form info
    if post.save
      # code to set up congratulations message
      flash[:success] = "Great! Your post has been created!"
      redirect_to post_path(@post.id) # go to show page for @post
      # redirect_to @post
    else
      # code teo setup error message
      flash[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # code to find the post we want and sent 
    # user to the Edit view for it (edit.html.erb), which has a
    # form for editing the post
  end

  def update
    # code to figure out which post we're trying to update, then
    # actually update the attributes of that post. Once that's
    # done, redirect us to somewhere like the Show page for that
    # post
  end

  def destroy
    # code to find the post we're referring to and
    # destroy it. Once that's done, redirect us to somewhere fun.
  end

  private

  def allow_post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
end