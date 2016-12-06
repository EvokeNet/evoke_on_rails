class PostsController < InheritedResources::Base
  
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        @space = Space::find(@post.space_id)
        format.html { redirect_to @space, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def post_params
      params.require(:post).permit(:title, :body, :user_id, :space_id)
    end
end

