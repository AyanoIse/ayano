class AddTweetIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :tweet, null: true, foreign_key: true
  end
end
