class ScratchpadsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "SUBSCRIBED!!!!!!!!! #{ActiveCable.server.connections.length}!!!!!!!!!!!!!!"
    stream_from "scratchpads_#{params[:room]}"
  end

  def unsubscribed
  
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    scratchpad = Scratchpad.find(data["id"])
    scratchpad.update!(scratchpad_text: data["text"])
    ActionCable.server.broadcast("scratchpads_#{params[:room]}", data)
  end

end
