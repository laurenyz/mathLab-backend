class AuthController < ApplicationController

    def create 
        user = User.find_by(email: params["email"])
        if user && user.authenticate(params["password"])
            payload = {user_id: user.id}
            token = encode(payload)
            if user.image.attachment
                render json: {
                    user: user,
                    upvotes: user.upvotes.length,
                    error: false,
                    token: token,
                    image_url: user.get_image_url()
                } 
            else 
                render json: {
                    user: user,
                    upvotes: user.upvotes.length,
                    error: false,
                    token: token
                } 
            end
        else
            render json: {
                error: true,
                message: "Incorrect username/password combination."
            }
        end
    end
end