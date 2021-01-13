class Notice < ApplicationRecord
    belongs_to :user
    paginates_per 9
    validates :title, presence: true, length: {maximum: 50}
    validates :to, presence: true, length: {maximum: 30}
    validates :from, presence: true, length: {maximum: 30}
    validates :auther, length: {maximum: 20}
    validates :greet, length: {maximum: 50}
    validates :content, presence: true, length: {maximum:500}
end
