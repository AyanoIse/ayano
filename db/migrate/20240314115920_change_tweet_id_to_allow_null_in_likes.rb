class ChangeTweetIdToAllowNullInLikes < ActiveRecord::Migration[6.1]
  
  
    def change
      change_column_null :likes, :tweet_id, true
    end
  
    def down
      change_column_null :likes, :tweet_id, false
    end
    

end