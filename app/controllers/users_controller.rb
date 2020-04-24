class UsersController < ApplicationController

    def index
        users = User.all 
        
        render json: users, include: [:posts, :replies]
    end

    def show
        user = User.find(params[:id])

        render json: user, include: [:posts, :replies]
    end

    def profile
        token = request.headers["Authentication"]
        payload = decode(token)
        user = User.find(payload["user_id"])
        
        render json: {
                user: user,
                posts: user.posts,
                replies: user.replies,
                upvotes: user.upvotes.length
        }
    end
end
