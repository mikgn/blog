require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:user) { build(:user) }

    it "returns a success response" do
      @post = Post.create!(
        user: user,
        title: 'post',
        body: 'post body'
      )

      get :show, params: { id: @post.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it '#create' do
      initial_count = Post.count

      post :create, params: {
        user_id: subject.current_user.id,
        post: {
          title: 'post',
          body: 'post body'
        }
      }

      final_count = Post.count
      expect(final_count - initial_count).to eq(1)
    end
  end
end
