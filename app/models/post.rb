class Post < ApplicationRecord
	belongs_to :user
	has_many :post_categories, dependent: :destroy
	has_many :messages, dependent: :destroy
end
