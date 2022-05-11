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
    number_of_passes = TestPassage.where(user_id: @user.id)
                                  .where(test_id: @test.id).count
    number_of_passes == 1                                   
  end

  def passed_all_category?(category)
    test_ids = Test.show_tests(category).ids
    test_category_id = @test.category.id
    id_category = Category.find_by(title: category).id
    passed_tests_of_one_category = TestPassage.where(test_id: test_ids)
                                              .where(user_id: @user.id)
                                              .where(passed: true)
                                              .pluck(:test_id)
                                              .uniq.count

    passed_tests_of_one_category == test_ids.count && test_category_id == id_category
  end

  def passed_one_level_tests?(level)
    test_ids = Test.where(level: level.to_i).ids
    test_level_id = @test.level
    passed_tests_of_the_same_level = TestPassage.where(test_id: test_ids)
                                                .where(user_id: @user.id).where(passed: true)
                                                .pluck(:test_id)
                                                .uniq.count
   
    passed_tests_of_the_same_level == test_ids.count && test_level_id == level.to_i
  end
end