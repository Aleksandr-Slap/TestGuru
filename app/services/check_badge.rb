# frozen_string_literal: true

class CheckBadge 

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
  end 

  def call  
    Badge.all.each do |badge|
      if send(badge.rule_name, badge.rule_value)
        get_a_badge(badge)
      end
    end   
  end

  private           

  def get_a_badge(badge)
    @user.badges.push(badge)
  end  

  def test_passage_first?(nothing)
    TestPassage.where(user_id: @test_passage.user_id)
    .where(test_id: @test_passage.test_id).count == 1 
  end

  def passed_all_category?(category)

    test_ids = Test.show_tests(category).ids
    test_category_id = Test.find(@test_passage.test_id).category_id
    
    TestPassage.where(test_id: test_ids)
       .where(user_id: @test_passage.user_id)
       .where(passed: true)
       .pluck(:test_id)
       .uniq.count == test_ids.count && test_category_id == 25
  end

  def passed_one_level_tests?(level)

    test_ids = Test.where(level: level).ids
    test_level_id = Test.find(@test_passage.test_id).level

    TestPassage.where(test_id: test_ids)
    .where(user_id: @test_passage.user_id).where(passed: true)
    .pluck(:test_id)
    .uniq.count == test_ids.count && test_level_id == level
  end
end