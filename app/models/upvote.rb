class Upvote < ApplicationRecord
    belongs_to: voter, class_name: "User"
    belogns_to: reply
end
