class Like < ApplicationRecord
  belongs_to :ohayo
  belongs_to :user
  validates_uniqueness_of :ohayo_id, scope: :user_id
end
