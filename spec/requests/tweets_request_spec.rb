require "rails_helper"

RSpec.describe "Tweets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      tweets = create_list(:tweet, 2)
      get "/tweets"
      tweets.each do |tweet|
        expect(response.body).to include(tweet.content)
      end
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tweets/:id" do
    before do
      @tweet = create(:tweet)
    end

    context "with existing tweet" do
      before { get "/tweets/#{@tweet.id}" }

      it "returns http success" do
        expect(response.body).to include(@tweet.content)
        expect(response).to have_http_status(:success)
        # expect(response.path).to eq("/tweets/#{@tweet.id}")
      end
    end

    context "with non existing tweet" do
      before { get "/tweets/1111111" }

      it "handles non existing tweet and redirects" do
        expect(response).to redirect_to("/")
        follow_redirect!

        expect(flash[:alert]).to eq("Tweet not found")
      end
    end
  end

  describe "GET /tweets/:id/edit" do
    before do
      @tweet = create(:tweet)
    end

    context "with non signed in user" do
      before { get "/users/#{@tweet.user_id}/tweets/#{@tweet.id}/edit" }

      it "redirects to signin page" do
        expect(response.status).to eq(302)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    context "with signed in user" do
      context "same user as tweet user" do
        before do
          login_as(@tweet.user)
          get "/users/#{@tweet.user_id}/tweets/#{@tweet.id}/edit"
        end
        it "opens the page" do
          expect(response.status).to eq(200)
        end
      end

      context "not same user as tweet user" do
        before do
          @other_user = create(:user)
          login_as(@other_user)
        end

        context "with correct route" do
          before do
            get "/users/#{@tweet.user_id}/tweets/#{@tweet.id}/edit"
          end
          it "redirects as unauthorized url" do
            expect(response.status).to eq(302)
            expect(flash[:danger]).to eq("Unauthorized access")
          end
        end

        context "with in correct route" do
          before do
            get "/users/#{@other_user.id}/tweets/#{@tweet.id}/edit"
          end
          it "redirects as 404 url" do
            expect(response.status).to eq(302)
            expect(flash[:alert]).to eq("Tweet not found")
          end
        end
      end
    end
  end

  describe "PUT /tweets/:id" do
    before do
      @tweet = create(:tweet)
      @tweet_params = { tweet: { content: "aa" } }
    end

    context "with non signed in user" do
      before do
        put "/users/#{@tweet.user_id}/tweets/#{@tweet.id}", params: @tweet_params
      end
      it "redirects to signin page" do
        expect(response.status).to eq(302)
        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    context "with signed in user" do
      context "not same user as tweet user" do
        before do
          @other_user = create(:user)
          login_as(@other_user)
        end

        context "with correct route" do
          before do
            put "/users/#{@tweet.user_id}/tweets/#{@tweet.id}", params: @tweet_params
          end
          it "redirects as unauthorized url" do
            expect(response.status).to eq(302)
            expect(flash[:danger]).to eq("Unauthorized access")
          end
        end

        context "with in correct route" do
          before do
            put "/users/#{@other_user.id}/tweets/#{@tweet.id}", params: @tweet_params
          end
          it "redirects as 404 url" do
            expect(response.status).to eq(302)
            expect(flash[:alert]).to eq("Tweet not found")
          end
        end
      end
    end
  end
end
