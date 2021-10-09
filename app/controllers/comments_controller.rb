class CommentsController < ApplicationController
    before_action :set_comment, only: [:show]
  
    # GET /posts/1/comments/1
    def show
      render json: @comment
    end
  
    # POST /posts/1/comments
    def create
      post = Post.find(params[:post_id])
      @comment = post.comments.new(comment_params)
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        post = Post.find(params[:post_id])
        @comment = post.comments.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def comment_params
        params.require(:comment).permit(:name, :content, :email_user)
      end
  end
  