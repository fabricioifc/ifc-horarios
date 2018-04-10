class AddTurmaAndDisciplineToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :turma, foreign_key: true
    add_reference :events, :discipline, foreign_key: true
  end
end
