class RepliesController < ApplicationController

    def index
        replies = Reply.all

        render json: replies, include: [:upvotes, :post, :replier]
    end

    def show
        reply = Reply.find(params[:id])

        render json: reply
    end

    def create
        reply = Reply.new(reply_params)
        if reply.valid?
            reply.save
            
            render json: reply
        else
            render json: {
                error: true,
                message: reply.errors.full_messages
            }
        end
    end

    def destroy
        reply = Reply.find(params[:id])
        reply.destroy

        render json: {message: "reply deleted"}
    end

private

    def reply_params
        params.require(:reply).permit(:replier_id, :post_id, :reply_text)
    end
end