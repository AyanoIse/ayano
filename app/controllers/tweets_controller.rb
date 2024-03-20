class TweetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @tweet = Tweet.all

        @letters = Letter.all
        @tweets = @tweet.first 

      if @tweet.present? 
        @letters = @tweets.letters
      else
        @letters = []
      end
      @letter = Letter.new

      



    
    end

    def new
        @tweet = Tweet.new

       
    end

    def create
        tweet = Tweet.new(tweet_params)

        tweet.user_id = current_user.id

        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
    def show
        @tweets = Tweet.find(params[:id])

        @letters = @tweets.letters
        @letter = Letter.new
     end
   
        
   

    def edit
        @tweet = Tweet.find(params[:id])
    end

    def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
    end
    
    private
      def tweet_params
        params.require(:tweet).permit(:body)
      end
  
end
