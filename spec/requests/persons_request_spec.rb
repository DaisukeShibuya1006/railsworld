require 'rails_helper'

RSpec.describe "Persons", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/persons/new"
      expect(response).to have_http_status(:success)
    end
  end

end
