require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  login_user

  describe "POST #create" do
    it '#create' do
      initial_count = Comment.count
      post1 = create(:post, user: subject.current_user)

      post :create, params: {
        user_id: subject.current_user.id,
        post_id: post1.id,
        comment: {
          text: 'comment text'
        }
      }

      final_count = Comment.count
      expect(final_count - initial_count).to eq(1)
    end
  end
end
