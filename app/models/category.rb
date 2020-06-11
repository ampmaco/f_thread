class Category < ApplicationRecord
	has_many :posts, through: :post_categories, dependent: :destroy
end
