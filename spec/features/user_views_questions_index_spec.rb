require 'rails_helper'

feature 'view all questions', %Q{
  As a user
  I want to view all questions
  So that I can see the them
} do
  # Acceptance Criteria
  # * I must see the body of each question
  # * Ordered by most recent

  scenario 'user views all questions' do
    question = Question.create(body: "You know it bro? But really do you know it?")
    question2 = Question.create(body: "You know it bro? But reeeeeeeeally do you know it?")

    visit '/questions'
    expect(page).to have_content(question.body)
    expect(page).to have_content(question2.body)
    expect(page.text.index(question2.body)).to be < page.text.index(question.body)
    expect(page).to have_link("Submit a question")
  end

end

feature 'view one question', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do

  # Acceptance Criteria
  # * I must be able to get to this page from the questions index
  # * I must see the question's title
  # * I must see the question's description

  scenario 'user views all questions' do
    question = Question.create(body: "You know it bro? But really do you know it?", description: ("cuzzzzzz" * 20))

    visit "/questions/#{question.id}"
    expect(page).to have_content(question.body)
    expect(page).to have_content(question.description)
    expect(page).to have_link("EDIT QUESTION")
  end

end
