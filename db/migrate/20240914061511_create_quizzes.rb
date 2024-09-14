class CreateQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :quizzes do |t|
      t.string :question, null: false
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
