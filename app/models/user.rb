class User < ApplicationRecord
	def result(level)
	  Test.joins('JOIN user_tests ON tests.id = user_tests.test_id ').where(level: level).where('user_tests.user_id = ?', self.id)	
	end	
end
