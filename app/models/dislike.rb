class Dislike < ApplicationRecord
  belongs_to :post

  after_save_commit :sum_dislikes_count
  after_destroy_commit :reduce_dislikes_count

  validates :email_user, presence: true
  validates :email_user, uniqueness: { case_sensitive: false, scope: :post_id}

  private
    def sum_dislikes_count
      post = self.post
      post.update( dislikes_count: post.dislikes_count + 1 )
    end

    def reduce_dislikes_count
      post = self.post
      post.update( dislikes_count: post.dislikes_count - 1 )
    end
end
