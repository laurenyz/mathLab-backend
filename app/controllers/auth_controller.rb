class AuthController < ApplicationController

    def create 
        user = User.find_by(email: params["email"])
        if user && user.authenticate(params["password"])
            payload = {user_id: user.id}
            token = encode(payload)
            render json: {
                user: user,
                posts: user.posts,
                replies: user.replies,
                upvotes: user.upvotes.length,
                error: false,
                token: token
            } else 
                render json: {
                    error: true,
                    message: "Incorrect username/password combination."
                }
            end
    end
end
