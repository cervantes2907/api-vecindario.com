class Post < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :dislikes, dependent: :destroy

    validates :name, presence: true
    validates :content, presence: true
    validates :email_user, presence: true
end
