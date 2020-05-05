class UserScratchpadsController < ApplicationController
    def index
        user_scratchpads = UserScratchpad.all

        render json: user_scratchpads
    end

    def show
        user_scratchpad = UserScratchpad.all

        render json: user_scratchpad
    end

    def create
        scratchpad = Scratchpad.find_by(url: params[:url])
        user_scratchpad = UserScratchpad.new(user_id: params[:user_id], url: params[:url], name: params[:name], scratchpad_id: scratchpad.id)
        if user_scratchpad.valid?
            user_scratchpad.save
            render json: user_scratchpad
        else
            render json: {
                error: true,
                message: post.errors.full_messages
            }
        end
    end

    def destroy
        user_scratchpad = UserScratchpad.find(params[:id])
        user_scratchpad.destroy

        render json: {message: "saved scratchpad removed"}
    end

private

    def user_scratchpad_params
        params.require(:user_scratchpad).post(:user_id, :scratchpad_id, :name, :url)
    end

end
