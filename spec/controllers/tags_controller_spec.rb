require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  let(:tag) { build(:tag) }
  let(:post) { build(:post, title: 'newtitle', body: '#newhashtag') }

  describe "GET #show" do
    it "gets page with hashtag name" do
      get :show, params: { name: 'hashtag' }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { name: '#newhashtag' }
      expect(response).to be_successful
      expect(post.title).to eq('newtitle')
    end
  end
end
