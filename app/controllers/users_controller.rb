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
                user: user,
                upvotes: user.upvotes.length
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
                upvotes: user.upvotes.length,
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

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid?
            render json: {
                user: user,
                upvotes: user.upvotes.length,
                error: false,
            }
        else
            render json: {
                error: true,
                message: user.errors.full_messages
            }
        end
    end


    def destroy
        user = User.find(params[:id])
        user.posts.each do |post|
            post.replies.each do |reply|
                reply.destroy
            end
            post.destroy
        end
        user.replies.each{|reply| reply.destroy}
        user.destroy 

        render json: {message: "user deleted"}
    end

private

def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :image)
end
    
end


# name: params["name"], email: params["email"], username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"]