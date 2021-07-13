class Test < ApplicationRecord
  def self.sorting_categories(name_category)
    self.joins('join categories on categories.id = tests.category_id').where(categories: {title: name_category}).order('tests.title DESC').pluck('tests.title')
  end	
end
