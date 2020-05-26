require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do
  describe "GET /users_edits" do
    it "responds successfully" do
      sign_in_as @user
      get edit_user_path(@user)
      expect(response).to have_http_status(200)
    end
  end
end
