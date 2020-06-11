class Post < ApplicationRecord
	belongs_to :user
	has_many :categories, through: :post_categories, dependent: :destroy
	has_many :messages, dependent: :destroy
end
