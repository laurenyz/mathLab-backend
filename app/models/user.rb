class User < ApplicationRecord
    has_many :posts
    has_many :replies, class_name: "Reply", foreign_key: "replier_id"
    has_many :upvotes, through: :replies

    def total_upvotes
        self.upvotes.count
    end
end
