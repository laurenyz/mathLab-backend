class Reply < ApplicationRecord
    has_many: upvotes
    belongs_to: :post
    belongs_to: :replier, class_name: "User"
end
