# frozen_string_literal: true

module TestPassagesHelper

  def progressbar_html
    content_tag(:div,
                content_tag(:div, nil,
                            class: "progress-bar",
                            'aria-valuemax' => 100,
                            'aria-valuemin' => 0,
                            'aria-valuenow' => 0,
                            'role' => 'progressbar',
                            'style' => "width: 0%",
                            data: { questions_max: question_max(@test_passage),
                                    current_question_number: current_question_number(@test_passage) }),
                class: 'progress')
  end
  
  def question_max(test_passage)
    test_passage.test.questions.size
  end 

  def current_question_number(test_passage)
    test_passage.test.questions.find_index(test_passage.current_question)
  end 

end
