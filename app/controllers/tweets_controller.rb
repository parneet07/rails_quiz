class TweetsController < ApplicationController
    before_action :find_tweet, only: [:show, :edit, :update, :destroy]
    def index
        @tweets = Tweet.all
    end
    def new
        @tweets = Tweet.new
    end
    def create
        tweet_params = params.require(:tweet).permit(:title, :tweet)
        @tweets = Tweet.new(tweet_params)
        if @tweets.save
        redirect_to tweets_path, notice: "Tweet Created"
        else
            render :new
        end
      end
      def show
        @tweets = Tweet.find params[:id]
      end
      def edit
        @tweets = Tweet.find params[:id]
      end
      def update
        @tweets       = Tweet.find params[:id]
        tweet_params = params.require(:tweet).permit(:title, :tweet)
        if @tweets.update tweet_params
            redirect_to @tweets, notice: "Tweet Updated"
        else
          render :edit
        end
      end
      def destroy
        @tweets.destroy
        redirect_to tweets_path, notice: "Tweet Deleted"
      end

      private
 
  def find_tweet
    @tweets = Tweet.find params[:id]
  end
  def tweet_params
    params.require(:tweet).permit(:title, :tweet)
  end
end
