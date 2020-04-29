class ScratchpadsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'scratchpads'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    scratchpad = Scratchpad.find(data["id"])
    scratchpad.update!(scratchpad_text: data["text"])
    ActionCable.server.broadcast('scratchpads', data)
  end

end
