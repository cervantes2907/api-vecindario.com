require 'rails_helper'

RSpec.describe Like, type: :model do

  it { should validate_presence_of(:email_user) }
  it { is_expected.to belong_to(:post) }

  describe "uniqueness" do
    let!(:post) { create :post}
    subject { Like.new(email_user: "correo@gmail.com", post_id: post.id) }
    it { should validate_uniqueness_of(:email_user).scoped_to(:post_id).case_insensitive}
  end

end
