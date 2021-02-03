require 'rails_helper'

RSpec.describe "Tweets", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/tweets"
      expect(response).to have_http_status(:success)
    end
  end

 	describe "GET /tweets/:id" do
 		before do
 			@tweet = create(:tweet)
 		end

 		context "with existing tweet" do
 			before {  get "/tweets/#{@tweet.id}" }

	    it "returns http success" do
  	    expect(response).to have_http_status(:success)
    	end
 		end

 		context "with non existing tweet" do
 			before {  get "/tweets/1111111" }

	    it "handles non existing tweet and redirects" do
        expect(response).to redirect_to('/')
        follow_redirect!

        expect(flash[:alert]).to eq('Tweet not found')
    	end
 		end
 	end
end
