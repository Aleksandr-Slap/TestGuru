# frozen_string_literal: true

class ChangeDefaultValueCorrectInAnswer < ActiveRecord::Migration[6.1]
  def up
    change_column_default :answers, :correct, false
  end

  def down
  end  
end
