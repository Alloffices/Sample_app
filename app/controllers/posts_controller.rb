class PostsController < ApplicationController


	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.save
			redirect_to @post
		else
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
	end


  def update
    @post = Post.find(params[:id])
    # @booking.tennis_court = @tennis_court

    if @post.update(params[:post].permit(:title, :content))
      flash[:notice] = 'Your post was updated succesfully'
      redirect_to @post
    else
      render "edit"
    end
  end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	  def edit
	    @post = Post.find(params[:id])
	  end


	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

end
