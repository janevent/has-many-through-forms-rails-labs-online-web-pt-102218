class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |i, category_attributes|
      #self.categories.find_or_create_by(name: category_attributes[:name])
      category = Category.find_or_create_by(name: category_attributes[:name]
      )

      self.categories << category 
      self.post_categories.build(:category => category)
    end
  end
  #accepts_nested_attributes_for :categories, reject_if: proc { |attributes|# name.blank? }
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :users

end
