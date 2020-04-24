class Post < ApplicationRecord
    belongs_to :user
    has_many :replies
    has_many :tags
    validates :post_text, presence: true
    validates :subject, presence: true
end
