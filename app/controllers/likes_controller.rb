class LikesController < ApplicationController
    before_action :set_like, only: [:show, :destroy]

    # GET /post/1/likes?email_user=correo@gmail.com
    def index
      if params[:email_user].present?
        post = Post.find(params[:post_id])
        @like = post.likes.find_by(email_user: params[:email_user])
      end

      if @like
        render json: @like
      else
        render json: {}, status: :not_found
      end
    end

    # GET /posts/1/likes/1
    def show
      render json: @like
    end
  
    # POST /posts/1/likes
    def create
      post = Post.find(params[:post_id])
      @like = post.likes.new(like_params)
  
      if @like.save
        render json: @like, status: :created
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/1/likes/1
    def destroy
        @like.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_like
        post = Post.find(params[:post_id])
        @like = post.likes.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def like_params
        params.require(:like).permit(:email_user)
      end
  end
  