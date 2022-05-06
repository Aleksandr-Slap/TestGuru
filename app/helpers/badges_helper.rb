module BadgesHelper
  def rules
    rules = [
            {name: "test_passage_first?", description: "Пройти тест с первой попытки"},
            {name: "passed_all_back_end?", description: "Пройти все тесты категории Backend"},
            {name: "passed_one_level_tests?", description: "Пройти все тесты одного уровня"}
            ]
  end  
end
