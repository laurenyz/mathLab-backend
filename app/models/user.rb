class User < ApplicationRecord
    has_many :posts
    has_many :replies, class_name: "Reply", foreign_key: "replier_id"
    has_many :upvotes, through: :replies
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    validates :name, presence: true

    def total_upvotes
        self.upvotes.count
    end
end
