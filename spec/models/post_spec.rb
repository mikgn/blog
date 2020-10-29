require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { build(:user) }
  let(:post) { build(:post, user: user) }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a body' do
    post.body = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a user' do
    post.user = nil
    expect(post).to_not be_valid
  end
end
