class UpvotesController < ApplicationController

    def index
        upvotes = Upvotes.all

        render json: upvotes
    end

    def create
        upvote = Upvote.new(upvote_params)
        if upvote.valid?
            upvote.save

            render json: upvote
        else
            render json: {
                error: true,
                message: upvote.errors.full_messages
            }
        end
    end

private
    
    def upvote_params
        params.require(:upvote).permit(:voter_id, :reply_id)
    end
    
end

