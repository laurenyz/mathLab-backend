class UsersController < ApplicationController

    def index
        users = User.all 
        
        render json: users, include: [:posts, :replies]
    end

    def show
        user = User.find(params[:id])

        render json: user, include: [:posts, :replies]
    end
end
