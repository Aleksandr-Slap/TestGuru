# frozen_string_literal: true

class CheckBadge 

  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
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
    number_of_passes = TestPassage.where(user_id: @user.id, test_id: @test.id)
                                  .count
    number_of_passes == 1                                   
  end

  def passed_all_category?(category)

    return false if @test.category.title != category

    test_ids = Test.show_tests(category).ids
    passed_tests_of_one_category = TestPassage.where(test_id: test_ids, user_id: @user.id)
                                              .successful
                                              .pluck(:test_id)
                                              .uniq
                                              .count
                                              

    passed_tests_of_one_category == test_ids.count
  end

  def passed_one_level_tests?(level)

    return false if @test.level != level.to_i

    test_ids = Test.where(level: level.to_i).ids
    passed_tests_of_the_same_level = TestPassage.where(test_id: test_ids, user_id: @user.id,)
                                                .successful
                                                .pluck(:test_id)
                                                .uniq.count
   
    passed_tests_of_the_same_level == test_ids.count
  end
end