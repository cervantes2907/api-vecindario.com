class DislikesController < ApplicationController
    before_action :set_dislike, only: [:show, :destroy]

    # GET /post/1/likes?email_user=correo@gmail.com
    def index
      if params[:email_user].present?
        post = Post.find(params[:post_id])
        @dislike = post.dislikes.find_by(email_user: params[:email_user])
      end

      if @dislike
        render json: @dislike
      else
        render json: {}, status: :not_found
      end
    end
    # GET /posts/1/dislikes/1
    def show
      render json: @dislike
    end
  
    # POST /posts/1/dislikes
    def create
      post = Post.find(params[:post_id])
      @dislike = post.dislikes.new(dislike_params)
  
      if @dislike.save
        render json: @dislike, status: :created
      else
        render json: @dislike.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @dislike.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dislike
        post = Post.find(params[:post_id])
        @dislike = post.dislikes.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def dislike_params
        params.require(:dislike).permit(:email_user)
      end
  end
  