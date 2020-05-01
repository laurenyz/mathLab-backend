class User < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_many :posts
    has_many :replies, class_name: "Reply", foreign_key: "replier_id"
    has_many :upvotes, through: :replies
    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
    validates :name, presence: true
    validates :username, presence: true
    validates :email, format: { with: /@/ }, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }
    has_one_attached :image

    def total_upvotes
        self.upvotes.count
    end

    def get_image_url
        url_for(self.image)
    end
end
