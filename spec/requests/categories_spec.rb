require 'rails_helper'
# require 'spec_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it "Return response ok" do 
      get '/categories'
      expect(response).to have_http_status(200)
    end
  end
end
