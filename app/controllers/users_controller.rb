class UsersController < ApplicationController

    def index
        users = User.all 
        
        render :json => users, :include => [:replies => {:include => :upvotes}]
    end

    def show
        user = User.find(params[:id])

        render :json => user, :include => [:replies => {:include => :upvotes}]
    end


    def profile
        token = request.headers["Authentication"]
        payload = decode(token)
        user = User.find(payload["user_id"])
        
        render json: {
                user: user
        }
    end

    def create
        user = User.new(user_params) 
        user.update(password: params[:password])
        user.update(password_confirmation: params[:password_confirmation])
        if user.valid?
            user.save
            payload = {user_id: user.id}
            token = encode(payload)
            render json: {
                user: user,
                error: false,
                token: token
            }
        else
            render json: {
                error: true,
                message: user.errors.full_messages
            }
            user.delete
        end
    end

private

def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :image)
end
    
end


# name: params["name"], email: params["email"], username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"]