class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    limit = params[:limit] || 10
    page = params[:page] || 0

    if page.to_i > 0
      page = page.to_i - 1 
    end

    @posts = Post
              .limit(limit)
              .offset(page)
              .order(created_at: :desc)

    total_results = Post.count

    render json: {
                    page: (page.to_i + 1),
                    results: @posts,
                    total_pages: (total_results / limit.to_i),
                    total_results: total_results
                 }
  end

  # GET /posts/1
  def show
    render json: { 
                  id: @post.id, 
                  name: @post.name, 
                  content: @post.content,                  
                  email_user: @post.email_user,
                  likes_count: @post.likes_count,
                  dislikes_count: @post.dislikes_count,
                  comments_count: @post.comments_count,                  
                  likes: @post.likes,
                  comments: @post.comments.order(created_at: :asc),
                  dislikes: @post.dislikes,
                  created_at: @post.created_at,
                  updated_at: @post.updated_at
                 }
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :content, :email_user)
    end
end
