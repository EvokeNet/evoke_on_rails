class PostsController < InheritedResources::Base
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # PATCH/PUT
  
  def update
    respond_to do |format|
      if @post.update(post_params)
        @notice = 'User was successfully updated.'
        format.js
      end
    end
  end

  def edit
    respond_to do |format|               
        format.js
    end  
  end  
  
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

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id, :space_id)
    end
end

