require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_user

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: subject.current_user.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: subject.current_user.id }
      expect(response).to be_successful
    end
  end
end
