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
                            data: { questions_max: @test_passage.question_max,
                                    current_question_number: @test_passage.current_question_number }),
                class: 'progress')
  end
end
