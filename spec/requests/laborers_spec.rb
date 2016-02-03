require 'rails_helper'

RSpec.describe "Laborers", type: :request do
  describe "GET /laborers" do
    it "works! (now write some real specs)" do
      get laborers_path
      expect(response).to have_http_status(200)
    end
  end
end
