class Letter < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
end
