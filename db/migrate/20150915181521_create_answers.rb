class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.integer :question_id, null: false
      t.timestamps
    end
  end
end
