class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :components, presence: true
  validates :category_id, presence: true
  validates :available_count, presence: true
  belongs_to :category
end
