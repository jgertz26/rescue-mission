require 'rails_helper'

feature 'user views answers', %Q{
  As a user
I want to view the answers for a question
So that I can learn from the answer
} do

# - I must be on the question detail page
# - I must only see answers to the question I'm viewing
# - I must see all answers listed in order, most recent last

  scenario 'user views answers' do
    question = Question.create(body: "What makes the moon go around the earth go around the sun go around the polifon nexus go around...")
    answer1 = Answer.create(description: ("Cuz that's what it do" * 8), question: question)
    answer2 = Answer.create(description: ("Roiiiiiiiiiiiiiight" * 8), question: question)
    visit "/questions/#{question.id}"
    expect(page).to have_content(question.body)
    expect(page).to have_content("Answers:")
    expect(page).to have_content(answer1.description)
    expect(page).to have_content(answer2.description)
  end
end
