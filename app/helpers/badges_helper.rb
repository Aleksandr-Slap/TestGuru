module BadgesHelper
  def rules
    rules = [
            {name: "test_passage_first?", description: "Пройти тест с первой попытки"},
            {name: "passed_all_category?", description: "Пройти все тесты категории Backend или Frontend"},
            {name: "passed_one_level_tests?", description: "Пройти все тесты одного уровня"}
            ]
  end  
end
