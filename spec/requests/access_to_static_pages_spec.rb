# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Access to static_pages', type: :request do
  context 'GET #home' do
    before { get root_path }
    it 'responds successfully' do
      expect(response).to have_http_status 200
    end
    it "has title 'Ruby on Rails Tutorial Sample App'" do
      expect(response.body).to include 'Ruby on Rails Tutorial Sample App'
    end
  end
end
