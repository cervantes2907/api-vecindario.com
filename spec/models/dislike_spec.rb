require 'rails_helper'

RSpec.describe Dislike, type: :model do
  it { should validate_presence_of(:email_user) }
  it { is_expected.to belong_to(:post) }

  describe "should unique email_user and post_id" do
    let!(:post) { create :post}
    subject { Dislike.new(email_user: "correo@gmail.com", post_id: post.id) }
    it { should validate_uniqueness_of(:email_user).scoped_to(:post_id).case_insensitive}
  end
end
