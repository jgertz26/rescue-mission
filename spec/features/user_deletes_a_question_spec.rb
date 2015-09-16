require 'rails_helper'

feature 'user deletes a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do

  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

  scenario 'user deletes question' do
    body = "What makes the moon go around the earth go around the sun go around the polifon nexus go around..."
    description = "Freaking gravity ya dingus" * 15
    question = Question.create(body: body, description: description)
    visit "/questions/#{question.id}/edit"
    click_link "DELETE QUESTION"
    expect(page).to_not have_content(body)
  end
end
