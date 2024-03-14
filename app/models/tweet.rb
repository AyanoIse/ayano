class Tweet < ApplicationRecord
    belongs_to :user

    has_many :goods, dependent: :destroy
    has_many :gooded_users, through: :goods, source: :user
    has_many :letters, dependent: :destroy
end
