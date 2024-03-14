class LettersController < ApplicationController
    before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    letter = tweet.letters.build(letter_params) #buildを使い、contentとtweet_idの二つを同時に代入
    letter.user_id = current_user.id
    if letter.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end
  end

  private

    def letter_params
      params.require(:letter).permit(:content)
    end
end
