class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :my_tests, class_name: "Test"

	def result(level)
	  Test.joins('JOIN tests_users ON tests.id = tests_users.test_id ').where(level: level).where('tests_users.user_id = ?', self.id)	
	end	
end
