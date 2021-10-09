require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:email_user) }
  
  it { is_expected.to belong_to(:post) }
end
