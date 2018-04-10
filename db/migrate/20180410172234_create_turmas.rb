class CreateTurmas < ActiveRecord::Migration[5.1]
  def change
    create_table :turmas do |t|
      t.string :name

      t.timestamps
    end
  end
end
