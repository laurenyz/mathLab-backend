class PostsController < ApplicationController

    def index
        posts = Post.all 

        render json: posts, include: [:replies]
    end
end
