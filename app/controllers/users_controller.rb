class UsersController < ApplicationController

    def index
        users = User.all 
        
        render json: users.to_json({:include => [:replies => {:include => :upvotes}], :methods => :get_image_url })
    end

    def show
        user = User.find(params[:id])

        render json: user.to_json({:include => [:replies => {:include => :upvotes}], :methods => :get_image_url })
    end


    def profile
        token = request.headers["Authentication"]
        payload = decode(token)
        user = User.find(payload["user_id"])

        if user.scratchpads
            render json: {
                user: user,
                upvotes: user.upvotes.length,
                image_url: user.get_image_url(),
                scratchpads: user.scratchpads
                } 
        else
            render json: {
                user: user,
                upvotes: user.upvotes.length,
                image_url: user.get_image_url()
                } 
        end
    end

    def create
        user = User.new(user_params) 
        user.update(password: params[:password])
        user.update(password_confirmation: params[:password_confirmation])
        if user.valid?
            user.save
            payload = {user_id: user.id}
            token = encode(payload)
            user.default_image
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

    def uploadImage
       
        user = User.find(profile_picture_params[:id])
    
        user.image.attach(profile_picture_params[:image])
        if user.image.attached?
            render json: {
                image_url: user.get_image_url()
            }
        else
            render json: {errors: "No profile picture attached"}, status: 400
        end
            
        #   profile_picture_serializer = ProfilePictureSerializer.new(profile_picture: @user.profile_picture, user: @user)
        #   render json: profile_picture_serializer.serialize_new_profile_picture()
        # else
        #   render json: {errors: "No profile picture attached"}, status: 400
        # end
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid?
            render json: {
                user: user,
                upvotes: user.upvotes.length,
                error: false,
                image_url: user.image
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

def profile_picture_params
    params.permit(:image, :id)
  end
    
end


# name: params["name"], email: params["email"], username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"]