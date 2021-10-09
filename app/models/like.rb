class Like < ApplicationRecord
  belongs_to :post

  after_save_commit :sum_likes_count
  after_destroy_commit :reduce_likes_count

  validates :email_user, presence: true #, uniqueness: {case_sensitive: false }
  validates :email_user, uniqueness: { case_sensitive: false, scope: :post_id}

  private
    def sum_likes_count
      post = self.post
      post.update( likes_count: post.likes_count + 1 )
    end

    def reduce_likes_count
      post = self.post
      post.update( likes_count: post.likes_count - 1 )
    end
end
