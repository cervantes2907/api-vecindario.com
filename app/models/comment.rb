class Comment < ApplicationRecord
  belongs_to :post

  after_save_commit :sum_comments_count

  validates :name, presence: true
  validates :content, presence: true
  validates :email_user, presence: true

  private
    def sum_comments_count
      post = self.post
      post.update( comments_count: post.comments_count + 1 )
    end

end
