module TestsHelper

  TESTS_LEVELS = { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard'}.freeze

  def test_level(test)
    TESTS_LEVELS[test.level] || :hero
  end 

  def test_header(test)
    if test.new_record?
      "Create new test" 
    else 
      "Update #{test.title}"
    end
  end            
end
