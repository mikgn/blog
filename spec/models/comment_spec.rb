require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { build(:user) }
  let(:post) { build(:post, user: user) }
  let(:comment) { build(:comment, post: post, user: user) }

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without a text' do
    comment.text = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a user' do
    comment.user = nil
    expect(comment).to_not be_valid
  end
end