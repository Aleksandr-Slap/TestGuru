# frozen_string_literal: true

class CheckBadge 

  def initialize(test_passage) 
    @test_passage = test_passage
    @user = User.find(@test_passage.user_id)
  end 

  def call
    if @test_passage.passed_the_test? && test_passage_first?
      @badge = Badge.first 
      @user.badges.push(@badge)
    end 

    if passed_all_back_end?
      @badge = Badge.find(2)
      @user.badges.push(@badge)
    end  
    
    if passed_one_level_tests?
      @badge = Badge.last
      @user.badges.push(@badge)      
    end   
  end  

  def test_passage_first?
    TestPassage.where(user_id: @test_passage.user_id).where(test_id: @test_passage.test_id).count == 1
  end 

  def passed_all_back_end?
    TestPassage.where(test_id: backend_category).where(user_id: @test_passage.user_id).where(passed: true).count >= backend_category.count
  end


  def passed_one_level_tests?
    TestPassage.where(test_id: one_level_tests(find_level)).where(user_id: @test_passage.user_id).where(passed: true).count >= one_level_tests(find_level).count
  end

  private

  def backend_category
    Test.show_tests("Backend").ids
  end


  def one_level_tests(find_level)
    Test.where(level: find_level).ids
  end

  def find_level
    Test.find(@test_passage.test_id).level 
  end

end  