require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "index" do
    context "search by user ID" do
      before do
        get :search, params: {user_id: '123' }, format: :json
      end
      
      it "should be status 200" do
        expect(response.response_code).to eq(200)
      end
    end
  end
end
