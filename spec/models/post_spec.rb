require 'rails_helper'

RSpec.describe Post, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:email_user) }

  it { should have_many(:comments) }
  it { should have_many(:likes) }
  it { should have_many(:dislike) }
end
