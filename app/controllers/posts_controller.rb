class PostsController < ApplicationController

    def index
        posts = Post.all 

        render json: posts, include: [:replies, :tags, :user]
    end

    def show
        post = Post.find(params[:id])

        render json: post, include: [:replies, :tags, :user]
    end

    def create
        post = Post.new(post_params) 
        if post.valid?
            post.save
                if params[:tags]
                    Tag.create(post: post, tagline: params[:tags])
                end
            render json: post, include: [:replies, :tags, :user]
        else
            render json: {
                error: true,
                message: post.errors.full_messages
            }
        end
    end

    def destroy
            post = Post.find(params[:id])
            post.destroy
    
            render json: {message: "post deleted"}
    end

private

    def post_params
        params.require(:post).permit(:post_text, :subject, :user_id)
    end

end
